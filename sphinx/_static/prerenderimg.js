(function(){
  var e0 = document.querySelectorAll('div[class*="-ascidia.repl#"]')
  var cs = new window.URL(document.currentScript.src).pathname
  var dlp = document.location.pathname
  var L
  for (L = 0; L < cs.length && L < dlp.length && cs.charAt(L) == dlp.charAt(L); L++) {}
  var sp = cs.substr(0, cs.lastIndexOf('/') + 1) + dlp.substr(L).replace('.html', '')
  e0.forEach(function(e){
    var myImg = document.createElement('object')
    var id
    e.className.split(" ").forEach(function(cls){
      if (cls.indexOf("-ascidia.repl#") !== -1) {
	id = cls.split("#")[1]
      }
    })
    myImg.data = sp  + '/' + id + '.svg'
    myImg.type = 'image/svg+xml'
    myImg.id = id
    e.parentNode.replaceChild(myImg, e)
  })
})()
