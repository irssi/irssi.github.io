(function(){
    var e0 = document.querySelectorAll('.container.page > div pre.repl')
    e0.forEach(function(e){
	var myImg = document.createElement('object')
	myImg.data = e.id + '.svg'
	myImg.type = 'image/svg+xml'
	myImg.id = e.id
	e.parentNode.replaceChild(myImg, e)
    })
})()
