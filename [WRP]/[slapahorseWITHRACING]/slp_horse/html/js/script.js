$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data;
    });
});

$(function(){
    window.onload = (e) => { 
        window.addEventListener('message', (event) => {
            const item = event.data;
            

        });
    };
});