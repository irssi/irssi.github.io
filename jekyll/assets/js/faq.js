(function(){
  // the container which contains the faq
  var el = document.querySelector('.container.page > div')

  // hide or show content
  var hs = function(e,val){
    // val = show it?
    var symb = e.querySelector(':scope > .hideshow')
    if (val === undefined) {
      if (symb.textContent == '[+]') {
	val = true
      } else {
	val = false
      }
    }
    if (val) {
      symb.textContent = '[−]'
    } else {
      symb.textContent = '[+]'
    }

    var ns = e.nextSibling
    while (ns && !ns.onclick) {
      if (ns.classList) {
        ns.classList.toggle('hidden',!val)
      }
      ns = ns.nextSibling
    }
  }

  var kbdclickfn = function(f){
    return function(e){
      if (e.key === ' ' || e.key === 'Enter') {
        e.preventDefault()
        f(e)
      }
    }
  }
  // toggle one
  var hsclick = function(e){
    hs(e.currentTarget)
  }
  var hskbd = kbdclickfn(function(e){
    hs(e.currentTarget.parentNode)
  })
  // show all
  var hsclickall = function(e){
    el.querySelectorAll(':scope > h3').forEach(
      function(e){hs(e,true)}
    )
  }
  var hskbdall = kbdclickfn(function(e){
    hsclickall(e)
  })
  // hide all
  var hsclicknone = function(e){
    el.querySelectorAll(':scope > h3').forEach(
      function(e){hs(e,false)}
    )
  }
  var hskbdnone = kbdclickfn(function(e){
    hsclicknone(e)
  })

  // add ...all links
  var h1 = el.querySelector(':scope > h1')

  var togelnone = document.createElement('a')
  togelnone.onclick = hsclicknone
  togelnone.onkeypress = hskbdnone
  togelnone.tabIndex = 0
  togelnone.innerHTML = '[collapse all]'
  togelnone.style.cursor = 'pointer'
  h1.parentNode.insertBefore(togelnone, h1.nextSibling)

  h1.parentNode.insertBefore(document.createTextNode(' '), h1.nextSibling)

  var togelall = document.createElement('a')
  togelall.onclick = hsclickall
  togelall.onkeypress = hskbdall
  togelall.tabIndex = 0
  togelall.innerHTML = '[expand all]'
  togelall.style.cursor = 'pointer'
  h1.parentNode.insertBefore(togelall, h1.nextSibling)

  // add bindings
  el.querySelectorAll(':scope > h3').forEach(
    function(e){
      e.onclick = hsclick
      var newel = document.createElement('a')
      newel.onkeypress = hskbd
      newel.tabIndex = 0
      newel.innerHTML = '[+]'
      newel.className = 'hideshow'
      newel.style.cursor = 'pointer'
      e.insertBefore(document.createTextNode(' '), e.childNodes[0])
      e.insertBefore(newel, e.childNodes[0])
    }
  )

  // collapse all by default
  hsclicknone()
})()
