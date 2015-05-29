document.addEventListener 'keydown', (event) ->
    $('[rel=prev]').get(0)?.click() if event.keyCode == 37
    $('[rel=next]').get(0)?.click() if event.keyCode == 39
