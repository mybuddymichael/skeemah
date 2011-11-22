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

jQuery ->

  for klass, section of SECTIONS
    do (klass, section) ->
      $(klass).click (event) ->
        event.stopPropagation()
        $('#section_name').text(section)

  Raphael ->

    cp = $('#colorpicker')
    offset = cp.offset()

    Raphael.colorwheel(offset.left, offset.top, 320, '#ccc', cp.get(0))

