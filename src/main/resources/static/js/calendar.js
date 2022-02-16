var calendarMaker = (function(){    
    var calTot, start, nowYear, nowMonth, nowDate, thisY, thisM; //달력
    var dayText;
    var week4, week8, week12;
    return {
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
                    
                    calendarMaker.calMake();
                    calendarMaker.dayTextFunc(nowYear, nowMonth, nowDate);
                    
                    
                    //사물함 선택 날짜에 들어가는 값  
                    $(".tabCont .resDay .scrollD a").eq(0).attr("data-res",dayText);
                    $(".tabCont .resDay .scrollD a").eq(0).attr("data-end",week4);
                    $(".tabCont .resDay .scrollD a").eq(0).find("span").eq(1).html("4주 ("+dayText+" ~ "+week4+")");
                    
                    $(".tabCont .resDay .scrollD a").eq(1).attr("data-res",dayText);
                    $(".tabCont .resDay .scrollD a").eq(1).attr("data-end",week8);
                    $(".tabCont .resDay .scrollD a").eq(1).find("span").eq(1).html("8주 ("+dayText+" ~ "+week8+")");

                    $(".tabCont .resDay .scrollD a").eq(2).attr("data-res",dayText);
                    $(".tabCont .resDay .scrollD a").eq(2).attr("data-end",week12);
                    $(".tabCont .resDay .scrollD a").eq(2).find("span").eq(1).html("12주 ("+dayText+" ~ "+week12+")");
                    
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
                        }else{
                            $(".cal .calTable table tbody td").eq(index).removeClass("before");
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
                calendarMaker.calUse(thisY, thisM);
            });

            $(".calSel select#year").change(function(){// 년도 변경
                thisY = $(this).val(); 
                thisM = $(".calSel select#month").val();
                calendarMaker.calUse(thisY, thisM);
            });
        },
        calUse : function(thisY, thisM){// 달력 날짜 년도, 월 변경 시 달력 정보 가져옴
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
                    
                    calendarMaker.calMake();
				}
			});
        },
        dayTextFunc : function(year, month, date){
            if(month < 10){
                month = '0'+month;
            }
            if(date < 10){
                date = '0'+date;
            }
            dayText = year+'-'+month+'-'+date;

            $("#today").val(dayText);
            return dayText;
        },
    }
})();

var calendar = function(){
    calendarMaker.calSet();
    calendarMaker.calChange();
}