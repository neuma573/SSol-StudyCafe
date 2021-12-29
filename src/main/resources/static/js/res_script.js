var resScript = (function(){
    var $leftF, $topF, $topF2;
    var $lockerpayment=0, $seatpayment=0, $roompayment=0;
    var $html="";
    var year, month, calTot, start, nowYear, nowMonth, nowDate, thisY, thisM; //달력
    var store_no, res_date; //예약좌석
    var resStoreArr = [], resLocArr=[]; //예약 지역, 지점 배열 
    var seatTxt, lockerTxt; // 선택한 좌석명 txt , 선택한 사물함 명 txt
    var timeArr=[]; //좌석에서 선택한 시간 
    var resDetailArr=[]; // detail정보 담는 array
    var resListNum = 1; // detail 순서 num
    var addSeat=0, addRoom=0, addLock=0; //resAddClick()에서 사용 
    var realToday;
    var resArray=[];
    var locArr=[];
    var locPay;
    var locPayT = 0;
    var week4, week8, week12;
    var resChkList=[];
    var resArrList=[];
    var resOverlab=[];
    return{
        reserve : function(){ //실시간 예약 처음 로드됐을때 
            //실시간예약
            $(".reserveDiv .accoD .accoBox .accoTit").each(function(index) {
                $(this).on("click", function() {
                    setTimeout(function(){
                        $leftF = ($(window).innerWidth() - $(".reserveCont .inner").width())/2 + $(".reserveCont .reserveDiv").width() + 15;
                        $topF = $(".reserveCont .inner").offset().top - $(".nav").height();
                        $topF2 = $(".resCheck").offset().top - 35;
                        if($(window).scrollTop() > $topF){
                            $(".reserveCont .rightFix").addClass("fixed");
                            $(".reserveCont .rightFix").css({top:$(".nav").height(), left:$leftF, bottom:"auto"});
                        }else{
                            $(".reserveCont .rightFix").removeClass("fixed");
                            $(".reserveCont .rightFix").css({top:"", left:"", bottom:"auto"});
                        }
                        if(($(window).scrollTop() + $(window).height()) >= $topF2){
                            $(".reserveCont .rightFix").removeClass("fixed");
                            $(".reserveCont .rightFix").css({top:"auto", left:"", bottom:0});
                        }
                        resScript.resFixed();
                    },300);
                    
                    if ($(this).parents(".accoBox").hasClass("on")) {
                        $(this).parents(".accoBox").removeClass("on");
                        $(this).siblings(".accoCont").stop(true, true).slideUp(0);
                    } else {
                        $(this).parents(".accoBox").addClass("on");
                        $(this).siblings(".accoCont").stop(true, true).slideDown(0);
                        $(".reserveCont .tab a").eq(index).click();
                    }

                });
            });

            $(".reserveCont .tab a").each(function(index) {
                $(this).on("click", function() {
                    if (!$(this).hasClass("on")) {
                        $(".reserveCont .tab a").removeClass("on");
                        $(".reserveCont .tabCont > div").removeClass("on");
                        $(this).addClass("on");
                        $(".reserveCont .tabCont > div").eq(index).addClass("on");
                    }

                });
            });

            for(var d=1; d<=31; d++){
                $(".seatDiv .deskD").append("<a href='javascript:' data-val='desk_"+d+"' class='desk seat'><span>좌석"+d+"</span></a>");	
            }
            
            for(var r=1; r<=4; r++){
                $(".seatDiv .roomD").append("<a href='javascript:' data-val='room_"+r+"' class='room seat'><span>ROOM"+r+"</span></a>");	
            }
            
            for(var l=1; l<=20; l++){
                $(".lockerDiv .lockerD").append("<a href='javascript:' data-val='locker_"+l+"' class='locker'><span>사물함"+l+"</span></a>");	
            }
        },
        calSet : function(){ //달력 처음 로드됐을때 
            $.ajax({
				type: "GET",
				url: "../calendarUse",
				success: function(data) {
                    nowYear = parseInt(data.nowYear);
                    nowMonth = parseInt(data.nowMonth);
                    nowDate = parseInt(data.nowDate);
                    start = parseInt(data.start);
                    calTot = parseInt(data.calTot);
                    week4 = data.week4;
                    week8 = data.week8;
                    week12 = data.week12;
                    if(nowMonth < 10){
                        nowMonth = parseInt("0"+nowMonth);
                    }
                    if(nowDate < 10){
                        nowDate = parseInt("0"+nowDate);
                    }
                    
                    realToday = nowYear+"-"+nowMonth+"-"+nowDate;
                    $("#today").val(realToday);
                    
                    for(var i=nowYear; i<=nowYear+1; i++){
                        if(i==nowYear){
                            $(".calSel select#year").append("<option value="+i+" selected>"+i+"년</option>");
                        }else{
                            $(".calSel select#year").append("<option value="+i+">"+i+"년</option>");
                        }
                    }

                    for(var j=1; j<=12; j++){
                        if(j==nowMonth){
                            $(".calSel select#month").append("<option value="+j+" selected>"+j+"월</option>");
                        }else{
                            $(".calSel select#month").append("<option value="+j+">"+j+"월</option>");
                        }
                    }
                    
                    resScript.calMake();
                    $(".slcDeTail .date .data").html(nowYear+"-"+nowMonth+"-"+nowDate); // 디테일 입력 정보 - 날짜 
                    
                    $(".tabCont .resDay .scrollD a").eq(0).attr("data-res",realToday);
                    $(".tabCont .resDay .scrollD a").eq(0).attr("data-end",week4);
                    $(".tabCont .resDay .scrollD a").eq(0).find("span").eq(1).html("4주 ("+realToday+" ~ "+week4+")");
                    
                    $(".tabCont .resDay .scrollD a").eq(1).attr("data-res",realToday);
                    $(".tabCont .resDay .scrollD a").eq(1).attr("data-end",week8);
                    $(".tabCont .resDay .scrollD a").eq(1).find("span").eq(1).html("8주 ("+realToday+" ~ "+week8+")");

                    $(".tabCont .resDay .scrollD a").eq(2).attr("data-res",realToday);
                    $(".tabCont .resDay .scrollD a").eq(2).attr("data-end",week12);
                    $(".tabCont .resDay .scrollD a").eq(2).find("span").eq(1).html("12주 ("+realToday+" ~ "+week12+")");
                    
				}
			});  
        },
        calUse : function(thisY, thisM){// 달력 날짜 년도, 월 변경 시 
            $.ajax({
				type: "POST",
				url: "../calendarUse",
                data:{
                    year:thisY,
                    month:thisM
                },
				success: function(data) {
					nowYear = parseInt(data.nowYear);
                    nowMonth = parseInt(data.nowMonth);
                    nowDate = parseInt(data.nowDate);
                    start = parseInt(data.start);
                    calTot = parseInt(data.calTot);
                    
                    resScript.calMake();
				}
			});
        },
        calMake : function(){// 달력 
            var dayNum = 1;
            $(".cal .calTable table tbody td").removeClass("empty today");
            $(".cal .calTable table tbody td a").html("");
            
            thisM = $(".calSel select#month").val();
            thisY = $(".calSel select#year").val();
            $(".cal .calTable table tbody td").each(function(index){
                if(index < (start-1)){
                    $(".cal .calTable table tbody td").eq(index).addClass("empty");		
                }
                if(index >= (start-1) && index<calTot+(start-1)){
                    $(".cal .calTable table tbody td").eq(index).find("a").html(dayNum);
                    
                    if(thisY == nowYear){
                        if(thisM < nowMonth){
                            $(".cal .calTable table tbody td").eq(index).addClass("before");
                        }else if(thisM == nowMonth){
                            if(dayNum < nowDate){
                                $(".cal .calTable table tbody td").eq(index).addClass("before");
                            }else{
                                $(".cal .calTable table tbody td").eq(index).removeClass("before");
                            }
                            if(dayNum == nowDate){
                                $(".cal .calTable table tbody td").eq(index).addClass("today");
                            }
                        }
                    }else{
                        $(".cal .calTable table tbody td").removeClass("before");
                    }
                    
                    dayNum++;
                }
                if(index>=calTot+(start-1)){
                    $(".cal .calTable table tbody td").eq(index).addClass("empty");
                }
            });
        },
        calChange : function(){// 년도, 월 변경 시 
            $(".calSel select#month").change(function(){// 월 변경
                thisY = $(".calSel select#year").val(); 
                thisM = $(this).val();
                resScript.calUse(thisY, thisM);
            });

            $(".calSel select#year").change(function(){// 년도 변경
                thisY = $(this).val(); 
                thisM = $(".calSel select#month").val();
                resScript.calUse(thisY, thisM);
            });
        },
        deskPay : function($seatSize){//좌석 요금 
            $seatpayment = 0;
            if($seatSize < 4){
                $seatpayment=(1500*$seatSize);
            }else if($seatSize>=4 && $seatSize<6){
                $seatpayment=(5000+(1500*($seatSize-4)));
            }else if($seatSize>=6 && $seatSize<10){
                $seatpayment=(6000+(1500*($seatSize-6)));
            }else if($seatSize>=10 && $seatSize<12){
                $seatpayment=(6000+5000+(1500*($seatSize-10)));
            }else if($seatSize>=12 && $seatSize<16){
                $seatpayment=(10000+(1500*($seatSize-12)));
            }else if($seatSize>=16 && $seatSize<18){
                $seatpayment=(10000+5000+(1500*($seatSize-16)));
            }else if($seatSize>=18 && $seatSize<24){
                $seatpayment=(10000+6000+(1500*($seatSize-18)));
            }else if($seatSize==24){
                $seatpayment=20000;
            }
            return $seatpayment;
        },
        roomPay : function($roomSize){// room 요금 
            $roompayment=0;
            if($roomSize < 4){
                $roompayment=(6000*$roomSize);
            }else if($roomSize>=4 && $roomSize<6){
                $roompayment=(20000+(6000*($roomSize-4)));
            }else if($roomSize>=6 && $roomSize<10){
                $roompayment=(24000+(6000*($roomSize-6)));
            }else if($roomSize>=10 && $roomSize<12){
                $roompayment=(24000+20000+(6000*($roomSize-10)));
            }else if($roomSize>=12 && $roomSize<16){
                $roompayment=(40000+(6000*($roomSize-12)));
            }else if($roomSize>=16 && $roomSize<18){
                $roompayment=(40000+20000+(6000*($roomSize-16)));
            }else if($roomSize>=18 && $roomSize<24){
                $roompayment=(40000+24000+(6000*($roomSize-18)));
            }else if($roomSize==24){
                $roompayment=80000;
            }
            return $roompayment;
        },
        lockerPay : function(weekN){// 사물함 요금
            $lockerpayment = 0;
            if(weekN == 4){
                $lockerpayment = 9000;
            }else if(weekN == 8){
                $lockerpayment = 16000;
            }else if(weekN == 12){
                $lockerpayment = 24000;
            }
            return $lockerpayment;
        },
        resReset : function(){//예약 리셋 
            timeArr=[];
            dayTxt=null;
            $(".reserveCont .rightFix .resTime .scrollD a").removeClass("on");
            $(".reserveCont .rightFix .resDay .scrollD a").removeClass("on");
            $(".reserveCont .slcDeTail .total .pay").html("0");
            $(".reserveCont .seatDiv .seat").removeClass("on");
            $(".reserveCont .lockerDiv .locker").removeClass("on");
            // 좌석 선택 시 예약시간 노출
            $(".reserveCont .rightFix .resTime .none").show();
            $(".reserveCont .rightFix .resDay .none").show();
            $(".reserveCont .rightFix .scrollD").hide();
        },
        resFixed : function(){// fixed 영역 
            $leftF = ($(window).innerWidth() - $(".reserveCont .inner").width())/2 + $(".reserveCont .reserveDiv").width() + 15;
            $topF = $(".reserveCont .inner").offset().top - $(".nav").height();
            $topF2 = $(".resCheck").offset().top - 35;
            $(window).scroll(function() {
                if($(window).scrollTop() > $topF){
                    $(".reserveCont .rightFix").addClass("fixed");
                    $(".reserveCont .rightFix").css({top:$(".nav").height(), left:$leftF, bottom:"auto"});
                }else{
                    $(".reserveCont .rightFix").removeClass("fixed");
                    $(".reserveCont .rightFix").css({top:"", left:"", bottom:"auto"});
                }

                if(($(window).scrollTop() + $(window).height()) >= $topF2){
                    $(".reserveCont .rightFix").removeClass("fixed");
                    $(".reserveCont .rightFix").css({top:"auto", left:"", bottom:0});
                }
            });
            
            // 실시간예약 - 탭 height 
            $(".reserveCont .rightFix .tabD .tabCont > div").height($(window).innerHeight() - $(".nav").height() - $(".reserveCont .rightFix .cal").height() - $(".reserveCont .rightFix .tabD .tab").height() - 80);
            $(".reserveCont .reserveDiv").css("min-height", $(".reserveCont .rightFix").outerHeight());
            $(window).resize(function(){
                $leftF = ($(window).innerWidth() - $(".reserveCont .inner").width())/2 + $(".reserveCont .reserveDiv").width() + 15;
                $topF = $(".reserveCont .inner").offset().top - $(".nav").height();
                $topF2 = $(".resCheck").offset().top - 35;
                $(".reserveCont .rightFix .tabD .tabCont > div").height($(window).innerHeight() - $(".nav").height() - $(".reserveCont .rightFix .cal").height() - $(".reserveCont .rightFix .tabD .tab").height() - $(".totalPay").height() - 10);
                $(".reserveCont .reserveDiv").css("min-height", $(".reserveCont .rightFix").outerHeight());
            });

        },
        seatClick : function(){//좌석선택시 이벤트
            $(document).on("click", ".reserveCont .seatDiv .seat", function(){// 좌석 클릭 시 
                
                if($(".reserveCont select.location").val() == "none" || $(".reserveCont select.store").val() == "none"){
                    alert("지역, 지점명을 선택해주세요!");
                    return false;
                }

                if(!$(this).hasClass("on")){
                    var thisSeat = $(this).attr("data-val");
                    var resTime;
                    
                    //리셋
                    resScript.resReset();
                    $(".reserveCont .tabCont .resTime .none").hide();
                    $(".reserveCont .tabCont .resTime .scrollD").show();
                    $(".slcDeTail p").not(".location").not(".store").not(".date").find(".data").empty(); //디테일에서 지역, 지점 data 빼고 삭제 
                    $(".resTime .scrollD a").removeClass("no");
                    $(".resTime .scrollD a .mark").html("예약가능");

                    seatTxt = $(this).children("span").text();
                    $(this).addClass("on");
                    $(".slcDeTail .seat .data").append(seatTxt);
                    $(".slcDeTail .seat .data").attr("data-val", $(this).attr("data-val"));

                    // 좌석 별 예약시간 데이터 뿌려줌,, 
                    if(resArray.lenght != 0){ //선택 날짜에 예약 내역이 있을때 
                        for(var r=0; r<resArray.length; r++){
                            if(thisSeat == resArray[r].seat){//선택한 좌석이 예약 내역에 있으면 
                                resTime=resArray[r].times;
                            }
                        }
                    }

                    if(resTime != null){ //선택한 좌석이 예약 내역에 있으면 - 예약완료
                        resTime = resTime.split(",");
                        for(r=0; r<resTime.length; r++){
                            $(".resTime .scrollD a").each(function(index){
                                if($(".resTime .scrollD a").eq(index).attr("data-time") == resTime[r]){
                                    $(".resTime .scrollD a").eq(index).addClass("no");
                                    $(".resTime .scrollD a").eq(index).find(".mark").html("예약완료");
                                }
                            });
                        }
                    }
                    
                    // 좌석선택하면 좌석 탭 보여지게 
                    if(!$(".reserveCont .rightFix .tabD .tab a").eq(0).hasClass("on")){
                        $(".reserveCont .rightFix .tabD .tab a").eq(0).click();
                    }
                } //if
            });//click
        },
        seatTimeClick : function(){// 예약시간 선택 
            timeArr=[];
            $(".slcDeTail .time .data").empty();
            $(document).on("click", ".resTime .scrollD a", function(e){

                if($(this).hasClass("no")) return false;
                if(!$(this).hasClass("on")){
                    $(this).addClass("on");
                    timeArr.push({time1:$(this).attr("data-time"), time2:$(this).find("span").eq(1).text()});
                }else{
                    $(this).removeClass("on");

                    for(var t=0; t<timeArr.length; t++){
                        if(timeArr[t].time1 == $(this).attr("data-time")){
                            timeArr.splice(t,1);
                        }
                    }
                }
                
                timeArr.sort(function (a, b) {//시간 오름차순 
                    if (a.time1 > b.time1) { 
                        return 1;
                    }
                    if (a.time1 < b.time1) { 
                        return -1; 
                    } 
                    return 0;
                });

                if(timeArr.length != 0){// 디테일 입력 정보
                    if(timeArr.length > 1){
                        $(".slcDeTail .time .data").html(timeArr[0].time2+" 외 "+(timeArr.length-1)+"건");
                    }else{
                        $(".slcDeTail .time .data").html(timeArr[0].time2);
                    }
                }else{
                    $(".slcDeTail .time .data").empty();
                }

                var seatTxt = $(".slcDeTail .seat .data").text();
                if(seatTxt.indexOf("좌석")==0){
                    $(".slcDeTail .total .pay").html(numberWithCommas(resScript.deskPay(timeArr.length)));
                }else{
                    $(".slcDeTail .total .pay").html(numberWithCommas(resScript.roomPay(timeArr.length)));
                }

            });
        },
        lockerClick : function(){//사물함 선택 
            $(document).on("click", ".reserveCont .lockerD .locker", function(){// 사물함 클릭 시 
                if($(".reserveCont select.location").val() == "none" || $(".reserveCont select.store").val() == "none"){
                    alert("지역, 지점명을 선택해주세요!");
                    return false;
                }
                if($(this).hasClass("no")) return false;

                if(realToday != $(".slcDeTail .date .data").text()){
                    alert("사물함 예약은 금일("+realToday+") 날짜로만 가능합니다.");
                    return false;
                }
                if(!$(this).hasClass("on")){
                    //리셋
                    resScript.resReset();
                    $(".reserveCont .tabCont .resDay .none").hide();
                    $(".reserveCont .tabCont .resDay .scrollD").show();
                    $(".slcDeTail p").not(".location").not(".store").not(".date").find(".data").empty(); //디테일에서 지역, 지점 data 빼고 삭제 
                    $(".resDay .scrollD a").removeClass("no");
                    $(".resDay .scrollD a .mark").html("예약가능");
                
                    lockerTxt = $(this).children("span").text();
                    $(this).addClass("on");
                    
                    $(".slcDeTail .seat .data").append(lockerTxt);
                    $(".slcDeTail .seat .data").attr("data-val", $(this).attr("data-val"));
                    if(!$(".reserveCont .rightFix .tabD .tab a").eq(1).hasClass("on")){
                        $(".reserveCont .rightFix .tabD .tab a").eq(1).click();
                    }
                }//if
            });//click
        },
        resAddClick : function(){ // 예약 추가 버튼 클릭 시 
            if(timeArr.length != 0 || dayTxt != null || $(".slcDeTail .date .data").text() != null){
                var basicPay=0;
            
                if($(".slcDeTail .total .pay").text() == 0) return false;

                var detailLoc = $(".slcDeTail .location .data").text();
                var detailStore = $(".slcDeTail .store .data").text();
                var datailSeat = $(".slcDeTail .seat .data").text();
                var datailSeatVal = $(".slcDeTail .seat .data").attr("data-val");
                var detailDate = $(".slcDeTail .date .data").text();
                if(resDetailArr.length != 0){
                    if(resDetailArr[0].store != detailStore){
                        alert("같은 매장의 좌석, 사물함만 예약 가능합니다.");
                        return false;
                    } 
                }

                if(datailSeat.indexOf("좌석")==0){
                    basicPay = 1500;
                }else if(datailSeat.indexOf("ROOM")==0){
                    basicPay = 6000;
                }else if(datailSeat.indexOf("사물함")==0){
                    basicPay = locPay;
                    locPayT+=locPay;
                }
                
                
                if(resDetailArr.length != 0){
                    for(var r=0; r<resDetailArr.length; r++){
                        if(resDetailArr[r].seat == datailSeat){
                            if(timeArr.length != 0){//좌석,room
                                for(var t=0; t<timeArr.length; t++){
                                    if(resDetailArr[r].date == detailDate &&resDetailArr[r].time == timeArr[t].time2) {
                                        alert("이미 선택한 시간이 포함되어 있습니다. 다시 선택해주세요.");
                                        return false;
                                    }
                                }
                            }else{//사물함 
                                if(resDetailArr[r].seat == datailSeat) {
                                    alert("사물함은 4주, 8주, 12주 중 하나만 선택 가능합니다. \n 예약확인내역에서 사물함을 삭제 후 다시 선택해 주세요.");
                                    return false;
                                }
                            }
                        }
                    }
                }// if

                if(timeArr.length != 0){
                    for(var r=0; r<timeArr.length; r++){
                        resDetailArr.push({
                            loc:detailLoc,
                            store:detailStore,
                            seat:datailSeat,
                            seatVal:datailSeatVal,
                            date:detailDate,
                            time:timeArr[r].time2,
                            timeVal:timeArr[r].time1,
                            pay:basicPay
                        });
                    }
                }else{
                    resDetailArr.push({
                        loc:detailLoc,
                        store:detailStore,
                        seat:datailSeat,
                        seatVal:datailSeatVal,
                        date:detailDate,
                        time:$(".slcDeTail .time .data").text(),
                        pay:basicPay
                    });
                }

                resScript.arrList(resDetailArr);
                resScript.resReset();
                $(".slcDeTail p").not(".location").not(".store").not(".date").find(".data").empty();
                
            }
        },
        arrList : function(resDetailArr){
            addSeat=0, addRoom=0, addLock=0, resListNum=1;
            function sortline(a,b){
                if(a.date < b.date){
                    return -1;
                }
                if(a.date > b.date){
                    return 1;
                }
                return 0;
            }
            function sortline2(a,b){
                if(a.seat < b.seat){
                    return -1;
                }
                if(a.seat > b.seat){
                    return 1;
                }
                return 0;
            }
            
            resDetailArr.sort(sortline2);
            resDetailArr.sort(sortline);
            
            $(".reserveCont .resCheck .listD").empty();
            // 예약확인 list
            for(var l=0; l<resDetailArr.length; l++){
                $html="";
                $html+="<div class='list'><div><p class='num'>"+resListNum+"</p>";
                $html+="<p class='location'>"+resDetailArr[l].loc+"</p>";
                $html+="<p class='store' name='store_no'>"+resDetailArr[l].store+"</p>";
                $html+="<p class='seat' name='seat_code'>"+resDetailArr[l].seat+"</p>";
                $html+="<p class='date' name='res_date'>"+resDetailArr[l].date+"</p>";
                $html+="<p class='time' name='times'>"+resDetailArr[l].time+"</p>";
                $html+="<p class='pay' >"+numberWithCommas(resDetailArr[l].pay)+"원</p>";
                $html+="</div><a href='javascript:' class='del'>삭제</a></div>";
                $(".reserveCont .resCheck .listD").append($html);
                resListNum++;

                if(resDetailArr[l].seat.indexOf("좌석")==0){
                    addSeat++   
                }
                if(resDetailArr[l].seat.indexOf("ROOM")==0){
                    addRoom++   
                }
                if(resDetailArr[l].seat.indexOf("사물함")==0){
                    addLock++   
                }
            }
            
            resScript.arrListType2(resDetailArr);
            var totalPayment=0;
            for(var r=0; r<resOverlab.length; r++){
                totalPayment+=resOverlab[r].total;
            }
            
            // 예약 결제 정보에 노출되는 정보 
            /*if(addRoom>0 || addSeat>0 || addLock>0){
                $(".resTotD").show();
            }else if(addRoom==0 && addSeat==0 && addLock==0){
                $(".resTotD").hide();
            }
            if(addSeat>0){//좌석을 1개 이상 선택했을때 
                $(".resTotD .resTot.seatT").css("display","flex");
                $(".resTotD .resTot.seatT .num").html(addSeat);
                $(".resTotD .resTot.seatT .pay").html(numberWithCommas(addSeat*1500));
                $(".resTotD .resTot.seatT .disPay").html(numberWithCommas(totSeat));
            }else{
                $(".resTotD .resTot.seatT").css("display","none");
                $(".resTotD .resTot.seatT span").html(0);
            }
        
            if(addRoom>0){//ROOM 1개 이상 선택했을때 
                $(".resTotD .resTot.roomT").css("display","flex");
                $(".resTotD .resTot.roomT .num").html(addRoom);
                $(".resTotD .resTot.roomT .pay").html(numberWithCommas(addRoom*6000));
                $(".resTotD .resTot.roomT .disPay").html(numberWithCommas(totRoom));
            }else{
                $(".resTotD .resTot.roomT").css("display","none");
                $(".resTotD .resTot.roomT span").html(0);
            }
        
            if(addLock>0){//사물함 1개 이상 선택했을때 
                $(".resTotD .lockerT").css("display","flex");
                $(".resTotD .resTot.lockerT .num").html(addLock);
                $(".resTotD .resTot.lockerT .pay").html(numberWithCommas(locPayT));
            }else{
                $(".resTotD .lockerT").css("display","none");
                $(".resTotD .resTot.lockerT .num").html(0);
                $(".resTotD .resTot.lockerT .pay").html(0);
            }*/

            $(".reserveCont .totalPay .num").html(addSeat+addRoom+addLock);
            $(".reserveCont .totalPay .pay").html(numberWithCommas(totalPayment));

        },
        arrListType2 : function(resDetailArr){
            resOverlab = [];
            var res_date, seat, seatVal, time, timeVal, size, total, end_date;
            
            for(var r=0; r<resDetailArr.length; r++){
                res_date = resDetailArr[r].date;
                seat = resDetailArr[r].seat;
                seatVal = resDetailArr[r].seatVal;
                time = resDetailArr[r].time+", ";
                timeVal = resDetailArr[r].timeVal+",";
                size = 1;
                total=0;
                end_date="";
                pay=resDetailArr[r].pay;

                for(var r2=r+1; r2<resDetailArr.length; r2++){
                    if(resDetailArr[r].date == resDetailArr[r+1].date && resDetailArr[r].seat == resDetailArr[r+1].seat){
                        time+=resDetailArr[r2].time+", ";
                        timeVal+=resDetailArr[r2].timeVal+",";
                        size++;
                        r++;
                    }
                }
                
                if(seatVal.indexOf("desk")==0){
                    total = resScript.deskPay(size);
                }else if(seatVal.indexOf("room")==0){
                    total = resScript.roomPay(size);
                }else if(seatVal.indexOf("locker")==0){
                    timeVal="";
                    total = resScript.lockerPay(parseInt(time.split("주")[0]));
                    end_date = time.substring(time.indexOf("~")+2,time.length-3);
                }
                
                resOverlab.push({
                    //db에 입력될
                    res_date:res_date,
                    seat_code:seatVal,
                    times:timeVal,
                    total:total,
                    end_date:end_date,
                    //화면에 보여질 
                    seat:seat,
                    time:time.trim(),
                    size:size,
                    pay:pay
                });
            }
            return resOverlab;
        },
        resSet : function(){// 실시간 예약 처음 로드됐을때 지역, 지점 선택
            $.ajax({
				type: "GET",
				url: "../reserve",
				success: function(data) {
                    resStoreArr = [];
		            resLocArr=[];
                    $.each(data,function(idx, val) {
                        resStoreArr.push({
                            store_no:val.store_no,
                            store_name:val.store_name,
                            addr:val.store_address.substring(0,2),
                            rcnt:val.room_count,
                            dcnt:val.desk_count,
                            bcnt:val.box_count
                        });

                        if(resLocArr.indexOf(val.store_address.substring(0,2))!=0){
                            resLocArr.push(val.store_address.substring(0,2));
                        }
                    });

                    // 지역 select - option
                    for(var j=0; j<resLocArr.length; j++){ 
                        $(".reserveCont select.location").append("<option>"+resLocArr[j]+"</option>");
                    }

                    // 지점 select - option
                    $(".reserveCont select.location").change(function(){// 지역 선택하면
                        if($(this).val() !== "none"){
                            $(".reserveCont select.store").empty();
                            $(".reserveCont select.store").append("<option value='none'>지점을 선택해주세요</option>");
                            for(var i=0; i<resStoreArr.length; i++){
                                if(resStoreArr[i].addr.indexOf($(this).val())==0){
                                    $(".reserveCont select.store").append("<option value="+resStoreArr[i].store_no+">"+resStoreArr[i].store_name+"</option>");
                                }	
                            }

                            $(".slcDeTail .location .data").html($(".reserveCont select.location option:selected").text());
                        }
                    });

				}
			});// ajax  
        },
        resState : function(store_no,res_date,rcnt,dcnt,bcnt){// 예약 된 좌석,룸 정보 로드 AJAX 후에 좌석 선택 
            $.ajax({
				type: "POST",
				url: "../reserveState",
                data:{
                    store_no:store_no,
                    res_date:res_date
                },
				success: function(data) {
                    //console.log(JSON.stringify(data));
                    resArray=[];
                    locArr=[];
                    $.each(data,function(idx, val) {
                        if(val.seat_code.indexOf("locker")!=0){
                            resArray.push({seat:val.seat_code, times:val.times});
                        }else{
                            if(val.store_no == store_no){
                                locArr.push({seat:val.seat_code, end_date:val.end_date});
                            }
                        }
                    });
                    
                    // 지점 별 좌석 노출 
                    $(".reserveCont .seatDiv .deskD").empty();
				    $(".reserveCont .seatDiv .roomD").empty();
                    $(".reserveCont .lockerDiv .lockerD").empty();

                    for(var d=0; d<dcnt; d++){ // 좌석 
                        $(".reserveCont .seatDiv .deskD").append("<a href='javascript:' class='desk seat' data-val='desk_"+(d+1)+"'><span>좌석"+(d+1)+"</span></a>");	
                    }
                    
                    for(var r=0; r<rcnt; r++){ // ROOM
                        $(".reserveCont .seatDiv .roomD").append("<a href='javascript:' class='room seat' data-val='room_"+(r+1)+"'><span>ROOM"+(r+1)+"</span></a>");			
                    }
                    

                    for(var b=0; b<bcnt; b++){ // 사물함 
                        $(".reserveCont .lockerDiv .lockerD").append("<a href='javascript:' class='locker' data-val='locker_"+(b+1)+"'><span>사물함"+(b+1)+"</span></a>");
                    }

                    for(var l=0; l<locArr.length; l++){
                        var lnum = parseInt((locArr[l].seat).split("_")[1]);
                        $(".lockerDiv .lockerD .locker").eq(lnum-1).addClass("no");
                        $(".lockerDiv .lockerD .locker").eq(lnum-1).append("<span class='hide'>~ "+locArr[l].end_date+"</span>");
                    }

				}
			});
        },
        resChange : function(){// 지점 선택, 달력 날짜 선택시 - resState 재호출 
            $(".reserveCont select.store").change(function(){// 지점 선택시
                if($(this).val() !== "none"){
                    resScript.resReset();
                    $(".slcDeTail p").not(".location").not(".date").find(".data").empty();

                    store_no = $(this).val();
                    res_date = $("#today").val();
                    
                    for(var i=0; i<resStoreArr.length; i++){
                        if(store_no == resStoreArr[i].store_no){
                            resScript.resState(store_no,res_date,resStoreArr[i].rcnt,resStoreArr[i].dcnt,resStoreArr[i].bcnt);
                        }
                    }
                    console.log("좌석, 사물함 예약정보 ajax 다시 불러옴");
                    $(".slcDeTail .store .location").html($(".reserveCont select.location option:selected").text());
                    $(".slcDeTail .store .data").html($(".reserveCont select.store option:selected").text());
                }
            });

            $(document).on("click", ".calTable table td a", function(){ //달력 날짜 선택시 
                if($(".reserveCont select.store").val() !== "none"){
                    if(!$(this).parents("td").hasClass("before") && !$(this).parents("td").hasClass("empty")){
                        resScript.resReset();
                        $(".slcDeTail p").not(".location").not(".store").find(".data").empty();

                        $(".calTable table td").removeClass("on");
                        $(this).parents("td").addClass("on");
                        
                        var selY = $(".calSel select#year").val();
                        var selM = $(".calSel select#month").val();
                        var selD = parseInt($(this).text());
                        if(selM < 10){selM="0"+selM};
                        if(selD < 10){selD="0"+selD};
                        $("#today").val(selY+"-"+selM+"-"+selD);
                        $(".slcDeTail .date .data").html(selY+"-"+selM+"-"+selD);

                        store_no = $(".reserveCont .slcD select.store").val();
                        res_date = selY+"-"+selM+"-"+selD;
                        
                        for(var i=0; i<resStoreArr.length; i++){
                            if(store_no == resStoreArr[i].store_no){
                                resScript.resState(store_no,res_date,resStoreArr[i].rcnt,resStoreArr[i].dcnt,resStoreArr[i].bcnt);
                            }
                        }
                    }
                }else{
                    alert("지역, 지점명을 선택해주세요!");
                    return false;
                }
            });
        },
        resChk : function(){// 결제하기 클릭 시 
            if(resDetailArr.length == 0){
                alert("선택된 좌석, 사물함이 없습니다.");
                return false;
            }

            resArrList = [];
            store_no = parseInt(store_no);
            for(var r=0; r<resDetailArr.length; r++){
                resArrList.push({
                    store_no:store_no,
                    seat_code:resDetailArr[r].seatVal,
                    res_date:resDetailArr[r].date,
                    times:resDetailArr[r].timeVal //시간코드 
                });
            }
            
            resScript.resChkAjax(resArrList);
        },
        resChkAjax: function(resArrList){ 
            $.ajax({
				type: "POST",
				url: "../resChk",
                contentType : "application/json; charset=UTF-8",
                traditional : true,
                data:JSON.stringify(resArrList),
				success: function(data) {
                    if(data>0){
                        alert("이미 예약된 좌석이 포함되어 있습니다. \n새로고침 후 다시 이용해주세요.");
                        return false;
                    }else{
                        $(".layerPop.resPop .listD").empty();
                        var html="";
                        var totalPayment=0;

                        // 팝업 
                        for(var p=0; p<resOverlab.length; p++){
                            html="";
                            html+="<div class='list'>";
                            html+="<div class='date'>"+resOverlab[p].res_date+"</div>";
                            html+="<div class='info'><span>"+resOverlab[p].seat+"</span> <p><span>예약시간 : </span><span>"+resOverlab[p].time.slice(0,-1)+"</span></p> </div>";
                            if(resOverlab[p].seat.indexOf("사물함")==0){
                                html+="<div class='tot'><span>총 "+resOverlab[p].time.split("주")[0]+"주</span><span>"+numberWithCommas(resOverlab[p].total)+"원</span></div>";
                            }else{
                                html+="<div class='tot'><span>총 "+resOverlab[p].size+"시간</span><span>"+numberWithCommas(resOverlab[p].total)+"원</span>";
                                if(resOverlab[p].size>=4){
                                    html+="<span class='disc'>"+numberWithCommas((resOverlab[p].pay*resOverlab[p].size)-resOverlab[p].total)+"원 할인!</span>";
                                }
                                html+="</div>";
                            }
                            html+="</div>"
                            $(".layerPop.resPop .listD").append(html);
                            totalPayment+=resOverlab[p].total;
                        }

                        $(".layerPop.resPop .total span").html(resOverlab.length+"건");
                        $(".layerPop.resPop .totalPay span").html(numberWithCommas(totalPayment)+"원");
                        
                        
                        layerPop("resPop");
                    }
				},
                error:function(request, status, error){
                    console.log("AJAX_ERROR");
                }
			});// ajax              

        },
        resFinalChk : function(in_email){//예약하기
            var resFinallArr=[];
            for(var r=0; r<resOverlab.length; r++){
                resFinallArr.push({
                    in_email : in_email,
                    store_no : store_no,
                    seat_code:resOverlab[r].seat_code,
                    res_date:resOverlab[r].res_date,
                    end_date:resOverlab[r].end_date,
                    times:resOverlab[r].times,
                    total:resOverlab[r].total
                });
            }
            
            $.ajax({
				type: "POST",
				url: "../reserveIns",
                contentType : "application/json; charset=UTF-8",
                traditional : true, 
                data:JSON.stringify(resFinallArr),
				success: function(data) {
                    if(data>0){
                        alert("예약 완료되었습니다. \n감사합니다.");
                        location.href="/reserve/reserve.do";
                    }
				},
                error:function(request, status, error){
                    console.log("reserve insert ajax 실패");
                }
			});// ajax    
        },
        resEtc : function(){
            //예약확인 리스트 목록 삭제 
            $(document).on("click", ".resCheck .list .del", function(){
                if($(this).parents(".list").find(".seat").text().indexOf("사물함")==0){
                    locPayT-= parseInt(withoutCommas($(this).parents(".list").find(".pay").text().split("원")[0]))
                }
                resDetailArr.splice($(this).parents(".list").index(),1);
                resScript.arrList(resDetailArr);
            });
            
            //예약 날짜 선택
            $(document).on("click", ".resDay .scrollD a", function(){ 
                $(".resDay .scrollD a").removeClass("on");
                $(this).addClass("on");
                $(".slcDeTail .time .data").html($(this).find("span").eq(1).text());
                
                locPay = resScript.lockerPay($(this).attr("data-week"));
                $(".slcDeTail .total .pay").html(locPay);

            });
        }
    }
})();

$(document).ready(function(){

});

$(window).on("load", function(){
    resScript.reserve();
    resScript.resFixed();
    resScript.calSet();
    resScript.calChange();
    resScript.resSet();
    resScript.seatTimeClick();
    resScript.resChange();
    resScript.seatClick();
    resScript.lockerClick();
    resScript.resEtc();
});