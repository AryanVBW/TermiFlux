document.addEventListener('DOMContentLoaded', () => {
    // Load the navigation
    const navContainer = document.querySelector('#nav-container');
    if (navContainer) {
        fetch('nav.html')
            .then(response => response.text())
            .then(data => {
                navContainer.innerHTML = data;
                initializeNav();
            });
    }
});

function initializeNav() {
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const navLinks = document.querySelector('.nav-links');
    const overlay = document.querySelector('.overlay');
    
    // Set active link based on current page
    const currentPage = window.location.pathname.split('/').pop().split('.')[0] || 'index';
    const activeLink = document.querySelector(`[data-page="${currentPage}"]`);
    if (activeLink) {
        activeLink.classList.add('active');
        activeLink.setAttribute('aria-current', 'page');
    }

    // Mobile menu functionality
    if (mobileMenuBtn && navLinks && overlay) {
        mobileMenuBtn.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            overlay.classList.toggle('active');
            const icon = mobileMenuBtn.querySelector('i');
            icon.classList.toggle('fa-bars');
            icon.classList.toggle('fa-times');
        });

        overlay.addEventListener('click', () => {
            navLinks.classList.remove('active');
            overlay.classList.remove('active');
            const icon = mobileMenuBtn.querySelector('i');
            icon.classList.add('fa-bars');
            icon.classList.remove('fa-times');
        });
    }
}