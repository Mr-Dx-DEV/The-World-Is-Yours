let percentage = 0;
let position = 'left'; 

function setPosition(pos) {
  position = pos;
  $('.level-container').removeClass('left right').addClass(position);
}

   function fillLevel(percentage) {
    var currentHeight = parseFloat($('.wave').css('height')) / parseFloat($('.level').height()) * 100;

    if (currentHeight !== percentage) {
      $('.wave').css({
        transition: 'height 1s ease-out', 
      });

      $('.wave').css({
        height: percentage + '%',
      });
    }
  }

window.addEventListener('message', function (event) {
  if (event.data.action === 'showLevel') {
    if (event.data.percentage) {
		fillLevel(event.data.percentage);
	}
	setPosition(event.data.position);	
    $('#container').css('display', 'block'); 
  } else if (event.data.action === 'hideLevel') {
    $('#container').css('display', 'none');  
  } else if (event.data.action === 'updateLevel') {
    fillLevel(event.data.percentage);
  }
});