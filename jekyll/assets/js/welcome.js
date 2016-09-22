var deck = [
    "//irssi-import.github.io/themes/sux.png",
    "//irssi-import.github.io/themes/swift.png",
    "//irssi-import.github.io/themes/syntax.png",
    "//irssi-import.github.io/themes/tinylajs.png",
    "//irssi-import.github.io/themes/trakhel.png",
    "//irssi-import.github.io/themes/trax.png",
    "//irssi-import.github.io/themes/xmas.png",
    "//irssi-import.github.io/themes/yellowsyntax.png",
    "//irssi-import.github.io/themes/ash.png",
    "//irssi-import.github.io/themes/c0ders.png",
    "//irssi-import.github.io/themes/dark_winter.png",
    "//irssi-import.github.io/themes/dot.png",
    "//irssi-import.github.io/themes/elf.png",
    "//irssi-import.github.io/themes/elho.png",
    "//irssi-import.github.io/themes/h3rbz.png",
    "//irssi-import.github.io/themes/hagge.png",
    "//irssi-import.github.io/themes/laaama-2.png",
    "//irssi-import.github.io/themes/lilah.png",
    "//irssi-import.github.io/themes/madcow.png",
    "//irssi-import.github.io/themes/more_readable.png",
    "//irssi-import.github.io/themes/mosdef.png",
    "//irssi-import.github.io/themes/murf.png",
    "//irssi-import.github.io/themes/n.png",
    "//irssi-import.github.io/themes/screwer.png",
    "https://cloud.githubusercontent.com/assets/5665186/4387270/d24911ce-43da-11e4-8d59-f3a14c95d790.jpg",
    "https://cloud.githubusercontent.com/assets/5665186/4387267/d2401f24-43da-11e4-8753-666ea552580a.png"
    ];
document.addEventListener("DOMContentLoaded", function(event) {
    'use strict';
    var disp = document.getElementsByClassName("welcome-img")[0];
    setInterval(function(){
	var img = new Image();
	var src = deck[Math.floor(Math.random() * deck.length)];
	img.src = src;
	img.onload = function() {
	    disp.style.backgroundImage = "url("+src+")";
	};
    }, 12*1000);
});
