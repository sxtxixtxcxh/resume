sticky_item = (sticky_item_selector, frame_selector)->
  $(frame_selector).each ->
    $frame = $(this);
    $item = $(sticky_item_selector, this);
      
    if $item.length > 0
      windowTop = $(window).scrollTop()
      
      frame = 
        offset: $frame.offset()
        width: $frame.width()
        height: $frame.height()
      
      
      item = 
        width: $item.width()
        height: $item.height()
      
      sticky =
        start: frame.offset.top - 10
        bottom: frame.offset.top + frame.height - item.height - 20
        end: frame.offset.top + frame.height
        left: frame.offset.left + item.width + 10
        width: item.width + 10;

      if windowTop > sticky.start && windowTop < sticky.bottom
        # window is scrolled below the start, but not past the bottom
        item_css = 
          position: 'fixed'
          top: 10
          bottom: ''
          left: sticky.left
          
      else if windowTop < sticky.start
        #  window is scrolled above start
        item_css =
          position: 'static'
          top: ''
          bottom: ''
          left: ''
          
      else if windowTop > sticky.bottom
        #  window is scrolled above bottom
        item_css = 
          position: 'absolute'
          bottom: 0
          top: ''
          left: sticky.width

      if item_css
        $item.css(item_css)
      
$(document).ready ->
  $(window).scroll ->
    sticky_item('h2.title', '.section')
  $(window).resize ->
    sticky_item('h2.title', '.section')

