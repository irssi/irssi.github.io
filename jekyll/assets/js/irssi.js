function initMenu() {
    'use strict';
    var toggle = document.getElementById("navbar-toggle"),
        menu = document.getElementById("navbar");
    toggle.addEventListener('click', function (event) {
        menu.classList.toggle("collapse");
    });
}

document.addEventListener("DOMContentLoaded", function(event) {
    initMenu();
});
