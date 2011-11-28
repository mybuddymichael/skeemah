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

mainFunction = ->
  Raphael ->
    cp = $('#colorpicker')
    offset = cp.offset()

    cw = Raphael.colorwheel(offset.left, offset.top, 320, '#ccc', cp.get(0))

    for klass, section of SECTIONS
      do (klass, section) ->
        $(klass).click (event) ->
          event.stopPropagation()

          selectedClass = klass
          $('#section_name').text(section)

          if klass == '#code' or klass == '.cl'
            classColor = $(klass).css('background-color')
          else
            classColor = $(klass).css('color')

          $('#section_name').css('color', classColor)
          cw.color(classColor)

    onchange = ->
      (color) ->
        color = Raphael.color(color)
        if selectedClass == '#code' or selectedClass == '.cl'
          $(selectedClass).css('background-color', color)
        else
          $(selectedClass).css('color', color)
        $('#section_name').css('color', color)

    cw.onchange = onchange()

jQuery ->
  mainFunction()
  $('#main a').pjax('[data-pjax-container]')
  $('body').bind 'pjax:end', mainFunction
