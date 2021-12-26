var resScript = (function(){
    var $leftF, $topF, $topF2;
    var $lockerpayment=0, $seatpayment=0, $roompayment=0;
    var $html="";
    var year, month, calTot, start, nowYear, nowMonth, nowDate, thisY, thisM; //달력
    var store_no, res_date; //예약좌석
    var resStoreArr = [], resLocArr=[]; //예약 지역, 지점 배열 
    var $clickSeat, $clicklocker; //선택한 좌석 tag, 선택한 사물함 tag
    var seatTxt, lockerTxt; // 선택한 좌석명 txt , 선택한 사물함 명 txt
    var timeArr=[]; //좌석에서 선택한 시간 
    var resDetailArr=[]; // detail정보 담는 array
    var resListNum = 1; // detail 순서 num
    var addSeat=0, addRoom=0, addLock=0; //resAddClick()에서 사용 

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
                    
                    $("#today").val(nowYear+"-"+nowMonth+"-"+nowDate);
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
                console.log(thisY+","+thisM);
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
        seatClick : function($clickSeat){//좌석선택시 이벤트
            if($(".reserveCont select.location").val() == "none" || $(".reserveCont select.store").val() == "none"){
                alert("지역, 지점명을 선택해주세요!");
            }else{
                if(!$clickSeat.hasClass("on")) {
                    // 리셋 
                    resScript.resReset();
                    $(".reserveCont .tabCont .resTime .none").hide();
                    $(".reserveCont .tabCont .resTime .scrollD").show();
                    $(".slcDeTail p").not(".location").not(".store").not(".date").find(".data").empty(); //디테일에서 지역, 지점 data 빼고 삭제 

                    seatTxt = $clickSeat.children("span").text();
                    $clickSeat.addClass("on");
                    
                    $(".slcDeTail .seat .data").append(seatTxt);

                    // 좌석선택하면 좌석 탭 보여지게 
                    if(!$(".reserveCont .rightFix .tabD .tab a").eq(0).hasClass("on")){
                        $(".reserveCont .rightFix .tabD .tab a").eq(0).click();
                    }
                }
            }
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
        lockerClick : function($clicklocker){//사물함 선택 

            if($(".reserveCont select.location").val() == "none" || $(".reserveCont select.store").val() == "none"){
                alert("지역, 지점명을 선택해주세요!");
            }else{
                if(!$clicklocker.hasClass("on")) {
                    // 리셋 
                    resScript.resReset();
                    $(".reserveCont .tabCont .resDay .none").hide();
                    $(".reserveCont .tabCont .resDay .scrollD").show();
                    $(".slcDeTail p").not(".location").not(".store").not(".date").find(".data").empty(); //디테일에서 지역, 지점 data 빼고 삭제 
                    
                    lockerTxt = $clicklocker.children("span").text();
                    $clicklocker.addClass("on");
                    
                    $(".slcDeTail .seat .data").append(lockerTxt);
                    if(!$(".reserveCont .rightFix .tabD .tab a").eq(1).hasClass("on")){
                        $(".reserveCont .rightFix .tabD .tab a").eq(1).click();
                    }
                }
            }    
        },
        resAddClick : function(){ // 예약 추가 버튼 클릭 시 
            if(timeArr.length != 0 || dayTxt != null || $(".slcDeTail .date .data").text() != null){
                var basicPay=0;
            
                if($(".slcDeTail .total .pay").text() == 0) return false;
                if($(".slcDeTail .seat .data").text().indexOf("좌석")==0){
                    basicPay = 1500;
                }else if($(".slcDeTail .seat .data").text().indexOf("ROOM")==0){
                    basicPay = 6000;
                }
                var detailLoc = $(".slcDeTail .location .data").text();
                var detailStore = $(".slcDeTail .store .data").text();
                var datailSeat = $(".slcDeTail .seat .data").text();
                var detailDate = $(".slcDeTail .date .data").text();
                for(var r=0; r<timeArr.length; r++){
                    resDetailArr.push({
                        loc:detailLoc,
                        store:detailStore,
                        seat:datailSeat,
                        date:detailDate,
                        time:timeArr[r].time2,
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
            $(".reserveCont .resCheck .listD").empty();

            // 예약확인 list
            for(var l=0; l<resDetailArr.length; l++){
                $html="";
                $html+="<div class='list'><div><p class='num'>"+resListNum+"</p>";
                $html+="<p class='location'>"+resDetailArr[l].loc+"</p>";
                $html+="<p class='store'>"+resDetailArr[l].store+"</p>";
                $html+="<p class='seat'>"+resDetailArr[l].seat+"</p>";
                $html+="<p class='date'>"+resDetailArr[l].time+"</p>";
                $html+="<p class='pay'>"+numberWithCommas(resDetailArr[l].pay)+"원</p>";
                $html+="</div><a href='javascript:' class='del'>삭제</a></div>";
                $(".reserveCont .resCheck .listD").append($html);
                resListNum++;

                if(resDetailArr[l].seat.indexOf("좌석")==0){
                    addSeat++   
                }
                if(resDetailArr[l].seat.indexOf("ROOM")==0){
                    addRoom++   
                }
            }
            
            // 예약 결제 정보에 노출되는 정보 
            if(addRoom>0 || addSeat>0 || addLock>0){
                $(".resTotD").show();
            }else if(addRoom==0 && addSeat==0 && addLock==0){
                $(".resTotD").hide();
            }
            
            // 총 금액 
            var totSeat = resScript.deskPay(addSeat);
            var totRoom = resScript.roomPay(addRoom);
            //var totLock = resScript.deskPay(addRoom);
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
                //$(".resTotD .resTot.lockerT .pay").html(numberWithCommas($lockerpayment));
            }else{
                $(".resTotD .lockerT").css("display","none");
                $(".resTotD .resTot.lockerT .num").html(0);
                $(".resTotD .resTot.lockerT .pay").html(0);
            }
        
            $(".reserveCont .totalPay .num").html(addSeat+addRoom+addLock);
            $(".reserveCont .totalPay .pay").html(numberWithCommas(totSeat+totRoom));

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

            // 지역, 지점선택 없이 좌석 선택하면 
            $(".reserveCont .seatDiv .seat, .reserveCont .lockerDiv .locker").on("click", function(){
                if($(".reserveCont select.location").val() == "none" || $(".reserveCont select.store").val() == "none"){
                    alert("지역, 지점명을 선택해주세요!");
                }
            });
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
                    var resArray=[];
                    $.each(data,function(idx, val) {
                        resArray.push({seat:val.seat_code, time:val.time});
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

                    $(document).on("click", ".reserveCont .seatDiv .seat", function(){// 좌석 클릭 시 
                        var thisSeat = $(this).attr("data-val");
                        var resTime;
                        $clickSeat = $(this);
                        
                        console.log(resArray);
                    
                        //리셋
                        $(".resTime .scrollD a").removeClass("no");
                        $(".resTime .scrollD a .mark").html("예약가능");

                        // 좌석 별 예약시간 데이터 뿌려줌,, 
                        if(resArray.lenght != 0){ //선택 날짜에 예약 내역이 있을때 
                            for(var r=0; r<resArray.length; r++){
                                if(thisSeat == resArray[r].seat){//선택한 좌석이 예약 내역에 있으면 
                                    resTime=resArray[r].time;
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

                        // 좌석 선택시 이벤트 
                        resScript.seatClick($clickSeat);
                    });

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
                    console.log(store_no + " , "+ res_date);
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
                        var selD = $(this).text();
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
        resEtc : function(){
            //예약확인 리스트 목록 삭제 
            $(document).on("click", ".resCheck .list .del", function(){
                resDetailArr.splice($(this).parents(".list").index(),1);
                resScript.arrList(resDetailArr);
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
    resScript.resEtc();
});