$(function(){

  $('.js-tooltip').each(function(){
    var target = $(this);
    target.tooltip({
      placement: target.data('placement') || 'top',
      title:     target.data('tooltip'),
      delay:     100
    });
  });

  $('.show-if-js').show();
  $('.hide-if-js').hide();

});
