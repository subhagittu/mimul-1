// ============================================================
// MIMUL — Theme Toggle & Modern Interactions
// ============================================================
(function() {
  'use strict';

  // ---------- Theme Toggle ----------
  var THEME_KEY = 'mimul-theme';

  function getPreferredTheme() {
    var stored = localStorage.getItem(THEME_KEY);
    if (stored) return stored;
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  }

  function applyTheme(theme) {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem(THEME_KEY, theme);
    var btn = document.getElementById('theme-toggle-btn');
    if (btn) btn.textContent = theme === 'dark' ? '☀️' : '🌙';
  }

  // Apply immediately (before paint)
  applyTheme(getPreferredTheme());

  document.addEventListener('DOMContentLoaded', function() {
    // Re-apply to ensure toggle reflects correctly
    applyTheme(getPreferredTheme());

    // Theme toggle button
    var btn = document.getElementById('theme-toggle-btn');
    if (btn) {
      btn.addEventListener('click', function() {
        var current = document.documentElement.getAttribute('data-theme');
        applyTheme(current === 'dark' ? 'light' : 'dark');
      });
    }

    // ---------- Mobile Menu ----------
    var mobileToggle = document.getElementById('nav-mobile-toggle');
    var navLinks = document.getElementById('nav-links');

    if (mobileToggle && navLinks) {
      mobileToggle.addEventListener('click', function() {
        navLinks.classList.toggle('open');
        var spans = mobileToggle.querySelectorAll('span');
        if (navLinks.classList.contains('open')) {
          spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
          spans[1].style.opacity = '0';
          spans[2].style.transform = 'rotate(-45deg) translate(5px, -5px)';
        } else {
          spans[0].style.transform = '';
          spans[1].style.opacity = '';
          spans[2].style.transform = '';
        }
      });
    }

    // Mobile dropdown toggles
    var navItems = document.querySelectorAll('.nav-links > li');
    for (var i = 0; i < navItems.length; i++) {
      (function(li) {
        var link = li.querySelector(':scope > a');
        var dropdown = li.querySelector('.nav-dropdown');
        if (link && dropdown) {
          link.addEventListener('click', function(e) {
            if (window.innerWidth <= 768 && dropdown) {
              e.preventDefault();
              li.classList.toggle('dropdown-open');
            }
          });
        }
      })(navItems[i]);
    }

    // ---------- Hero Slider ----------
    var sliderImages = document.querySelectorAll('.hero-slider img');
    if (sliderImages.length > 0) {
      var currentSlide = 0;
      sliderImages[0].classList.add('active');
      setInterval(function() {
        sliderImages[currentSlide].classList.remove('active');
        currentSlide = (currentSlide + 1) % sliderImages.length;
        sliderImages[currentSlide].classList.add('active');
      }, 4000);
    }

    // ---------- Accordion ----------
    var accordionHeaders = document.querySelectorAll('.spec-accordion-header');
    for (var j = 0; j < accordionHeaders.length; j++) {
      accordionHeaders[j].addEventListener('click', function() {
        var item = this.parentElement;
        var wasOpen = item.classList.contains('open');
        // Close all siblings in same accordion
        var accordion = item.parentElement;
        var items = accordion.querySelectorAll('.spec-accordion-item');
        for (var k = 0; k < items.length; k++) {
          items[k].classList.remove('open');
        }
        if (!wasOpen) item.classList.add('open');
      });
    }

    // ---------- Back to Top ----------
    var backToTop = document.getElementById('back-to-top');
    if (backToTop) {
      window.addEventListener('scroll', function() {
        if (window.scrollY > 400) {
          backToTop.classList.add('visible');
        } else {
          backToTop.classList.remove('visible');
        }
      });
      backToTop.addEventListener('click', function() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
      });
    }

    // ---------- Scroll Reveal ----------
    var revealElements = document.querySelectorAll('.reveal');
    if (revealElements.length > 0 && 'IntersectionObserver' in window) {
      var observer = new IntersectionObserver(function(entries) {
        for (var m = 0; m < entries.length; m++) {
          if (entries[m].isIntersecting) {
            entries[m].target.classList.add('visible');
          }
        }
      }, { threshold: 0.1, rootMargin: '0px 0px -40px 0px' });

      for (var n = 0; n < revealElements.length; n++) {
        observer.observe(revealElements[n]);
      }
    } else {
      // Fallback: just show everything
      for (var p = 0; p < revealElements.length; p++) {
        revealElements[p].classList.add('visible');
      }
    }

    // ---------- Navbar scroll shadow ----------
    var navbar = document.querySelector('.modern-nav');
    if (navbar) {
      window.addEventListener('scroll', function() {
        if (window.scrollY > 10) {
          navbar.style.boxShadow = '0 4px 20px rgba(0,0,0,0.08)';
        } else {
          navbar.style.boxShadow = '0 2px 8px rgba(0,0,0,0.06)';
        }
      });
    }
  });
})();
