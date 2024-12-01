// TIMER
 
var timer = false;

let minute = 00;
let second = 00;
let nSec = 00;

let saveMin = 00;
let saveSec = 00;
let saveNSec = 00;
 
function stopWatch() {
    if (timer) {
        nSec++;
 
        if (nSec == 100) {
            second++;
            nSec = 0;
        }
 
        if (second == 60) {
            minute++;
            second = 0;
        }
 
        if (minute == 60) {
            hour++;
            minute = 0;
            second = 0;
        }
 
        let minString = minute;
        let secString = second;
        let nSecString = nSec;
 
        if (minute < 10) {
            minString = "0" + minString;
        }
 
        if (second < 10) {
            secString = "0" + secString;
        }
 
        if (nSec < 10) {
            nSecString = "0" + nSecString;
        }
 
        document.getElementById('min').innerHTML = minString;
        document.getElementById('sec').innerHTML = secString;
        document.getElementById('nSec').innerHTML = nSecString;
        setTimeout(stopWatch, 10);
    }
}

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        const item = event.data;
        const min = item.min;
        const sec = item.sec;
        const nSec = item.nSec;
        const timerPlay = item.timerPlay;
        const numCount =  item.numCount;
        const hName = item.hName;
        const lapCount = item.lapCount;
        const position = item.position;
        const playerName = item.playerName;
        const maxPlayers = item.maxPlayers;
        const currPosition = item.currPosition;

        if (item.type !== undefined && item.type === "HUD") { 

            if (item.display === true) {
                $(".hud-container").fadeIn();
            } else {
                $(".hud-container").fadeOut();
            }
        }

        if (item !== undefined && item.type === "timer") {

            if (item.display === true) {

                if (timerPlay === true){
                    timer = true;
                }

                if (timerPlay === false){
                    timer = false;
                }
            }
            else{
                timer = false;
                minute = 0;
                second = 0;
                count = 0;
                document.getElementById('min').innerHTML = "00";
                document.getElementById('sec').innerHTML = "00";
                document.getElementById('nSec').innerHTML = "00";
            }
        }

        if (item !== undefined && item.type === "countdown") {
            if (item.display === true) {
                $(".start-countdown").css('display', 'flex');                
                $("#countNum").html(numCount);
            } else {                
                stopWatch();
                $(".start-countdown").hide();
                $("#countNum").html(0);
            }
        }

        if (item !== undefined && item.type === "horsename") {
            $("#horseName").html(hName);
        }

        if (item !== undefined && item.type === "lap") {
            $("#lapNum").html(lapCount);
        }

        if (item !== undefined && item.type === "maxPlayers") {
            if (maxPlayers > 3 && currPosition > 3){
                $("#nthPlace").html(currPosition);
                $(".position-wrapper .item.nth").css('display', 'flex');  
            } else {
                $(".position-wrapper .item.nth").hide();
            }
        }

        if (item !== undefined && item.type === "placement") {
            if (position == 1){
                $("#firstPlace").html(playerName);
            } else if (position == 2){
                $("#secondPlace").html(playerName);
            } else if (position == 3){
                $("#thirdPlace").html(playerName);
            } 
            
        }

        if (item !== undefined && item.type === "whip") {

            if (item.active === true) {
                $(".circle-ind").fadeIn();
                $(".circle-ind").addClass('active');
                $("#whipIcon").addClass('active');
            } else {
                $(".circle-ind").removeClass('active');
                $("#whipIcon").removeClass('active');
                $(".circle-ind").fadeOut();
            }

        }

        
        


    });
});