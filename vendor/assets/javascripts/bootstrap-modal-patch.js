$(document).modal().on('show', function(){
  $('body').css('overflow', 'hidden');
}).on('hide', function(){
  $('body').css('overflow', 'auto');
});
