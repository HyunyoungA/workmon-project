/*!
* Start Bootstrap - Agency v7.0.11 (https://startbootstrap.com/theme/agency)
* Copyright 2013-2022 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
*/
//
// Scripts
// 



function mem_click(mem) {
	var indi_mem = document.getElementById('indi_mem_login_tap');
	var comp_mem = document.getElementById('comp_mem_login_tap');
	var indi_mem_input = document.getElementById('indi_login_content_box');
	var comp_mem_input = document.getElementById('comp_login_content_box');
	if(mem.innerText == '기업회원') {
		indi_mem.classList.remove('check_login_Form_event');
		indi_mem_input.classList.add('check_login_input_event');
		
		mem.classList.add('check_login_Form_event');
		comp_mem_input.classList.remove('check_login_input_event');
		
	}else {
		comp_mem.classList.remove('check_login_Form_event');
		comp_mem_input.classList.add('check_login_input_event');
		
		mem.classList.add('check_login_Form_event');
		indi_mem_input.classList.remove('check_login_input_event');
	}
}



window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink');
        } else {
            navbarCollapsible.classList.add('navbar-shrink');
        }

    };

    // Shrink the navbar 
    navbarShrink();

    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 100,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

});
