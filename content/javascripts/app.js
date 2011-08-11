function sticky_section_header(){
  $('.section').each(function(){
    var $title = $('h2.title', this);
    if($title){
      var windowTop = $(window).scrollTop();
      var start = $title.data('start_sticky');
      var end = $title.data('end_sticky');
      var sticky_bottom = $title.data('sticky_bottom');
      var left = $title.data('left');
      var width = $title.data('width') + 10;
      if( windowTop > start && windowTop < sticky_bottom ){
        $title.css({position: 'fixed', top: 10, left: left});
      }else if( windowTop < start ){
        $title.css({position: 'static', top: '', bottom: '', left: ''});
      }else if( windowTop > sticky_bottom ){
        $title.css({position: 'absolute', bottom: 0, top: '', left: width});
      }else if( windowTop > end ){
        $title.css({position: 'static', top: '', bottom: '', left: ''});
      }
    }
  });
}

$(document).ready(function(){
  $('h2.title').each(function(){
    var $title = $(this);
    var $section = $title.parents('.section');
    var start_sticky = $section.offset().top -10;
    var end_sticky = $section.offset().top + $section.height();
    var sticky_bottom = end_sticky - $title.height() - 20;
    var left = $title.offset().left + $title.width() + 10;
    var width = $title.width();
    $title.data({start_sticky: start_sticky, end_sticky: end_sticky, sticky_bottom: sticky_bottom, left: left, width: width});
  });

  $(window).scroll(sticky_section_header);
  
});

