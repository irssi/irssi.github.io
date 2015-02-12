function initMenu() {
    'use strict';
    var toggle = document.getElementById("navbar-toggle"),
        menu = document.getElementById("navbar");
    // IE9+
    toggle.addEventListener('click', function () {
        // IE10+
        menu.classList.toggle("collapse");
    });
}

// IE9+
document.addEventListener("DOMContentLoaded", function(event) {
    initMenu();
});
