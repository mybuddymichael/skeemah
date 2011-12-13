SECTIONS =
  '#code': 'Background'
  '.c':  'Comment'
  '.cl': 'Cursor line'
  '.co': 'Constant'
  '.cu': 'Cursor'
  '.id': 'Identifier'
  '.ln': 'Line number'
  '.pp': 'PreProc'
  '.ra': 'rubyArrayDelimiter'
  '.rb': 'rubyBlock'
  '.rd': 'rubyDefine'
  '.rm': 'rubyMethodBlock'
  '.sp': 'Special'
  '.st': 'Statement'
  '.t':  'Type'

selectedClass = null
selectedContext = 'fg'

mainFunction = ->
  Raphael ->
    cp = $('#colorpicker')
    offset = cp.offset()

    cw = Raphael.colorwheel(offset.left, offset.top, 320, '#ccc', cp.get(0))

    for klass, section of SECTIONS
      do (klass, section) ->
        $(klass).mousedown (event) ->
          event.stopPropagation()

          selectedClass = klass
          $('#section_name').text(section)

          if klass == '#code' or klass == '.cl'
            selectedContext = 'bg'
            classColor = $(klass).css('background-color')
          else
            classColor = $(klass).css('color')

          $('#section_name').css('color', classColor)
          cw.color(classColor)

    onchange = ->
      (color) ->
        color = Raphael.color(color)
        if selectedContext == 'bg'
          $(selectedClass).css('background-color', color)
        else
          $(selectedClass).css('color', color)
        $('#section_name').css('color', color)

    cw.onchange = onchange()

  $('#fg_selector').mousedown (event) ->
    setForeground()
  $('#bg_selector').mousedown (event) ->
    setBackground()

jQuery ->
  mainFunction()
  $('#main a').pjax('[data-pjax-container]')
  $('body').bind 'pjax:end', mainFunction

setForeground = ->
  selectedContext = 'fg'
  if selectedClass == '#code'
    $('#section_name').text('Normal')

setBackground = ->
  selectedContext = 'bg'
  if selectedClass == '#code'
    $('#section_name').text('Background')
