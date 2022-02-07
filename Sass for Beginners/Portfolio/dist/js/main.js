const menuBtn = document.querySelector('.menu-btn');
const hamburger = document.querySelector('.menu-btn__burger');
const nav = document.querySelector('.nav');
const menuNav = document.querySelector('.menu-nav');
const navItems = document.querySelectorAll('.menu-nav__item');

// Initially the menu is not shown
let showMenu = false;

// Function: Rotate the burger when clicking
const toggleMenu =  () => {
    if (!showMenu) {

        // Assign the class "open" to the burger if the menu wasnt shown
        // Then, show the menu.
        hamburger.classList.add('open');
        nav.classList.add("open");
        menuNav.classList.add("open");
        
        // Add the class "open" to each nav item
        navItems.forEach(navItem => {
            navItem.classList.add('open');
        });

        // Show the menu
        showMenu = true;
        console.log("Deez nutz");
    }
    else {

        // Remove the class "open" to the burger.
        hamburger.classList.remove('open');
        nav.classList.remove("open");
        menuNav.classList.remove("open");

        // Remove the class "open" to each nav item
        navItems.forEach(navItem => {
            navItem.classList.remove('open');
        });

        // Hide the menu
        showMenu = false;
    }
}

// Listen for the click event on the burger
menuBtn.addEventListener('click', toggleMenu);
