---
title: "Five Rings Anti-Social Media"
---

# Five Rings Anti-Social Media

<div class="site-tagline">
An invitation-only gallery experience where the work speaks for itself.
</div>

<div class="site-navigation-prominent">
  <a href="/contact/" class="nav-link-prominent">Contact</a>
  <a href="/about/" class="nav-link-prominent">About</a>
</div>

## Recent Work

<div class="gallery-grid">
  <a href="/events/seckc-joe-grand/" class="gallery-item">
    <div class="gallery-info">
      <div class="gallery-title">SecKC - Joe Grand</div>
      <div class="gallery-meta">June 10, 2025 • 22 Photos</div>
      <div class="gallery-speaker">Joe "Kingpin" Grand - Hardware Hacking Expert</div>
      <div class="gallery-venue">Knuckleheads Garage</div>
    </div>
    <div class="gallery-thumbnail">
      <img src="/images/joe-grand-thumbnail.jpg" alt="Joe Grand" class="gallery-thumb-img">
    </div>
  </a>
  
  <a href="/galleries/fvp-close-to-home-june/" class="gallery-item">
    <div class="gallery-info">
      <div class="gallery-title">FVP Close to Home June</div>
      <div class="gallery-meta">July 17, 2025 • 62 Photos</div>
      <div class="gallery-speaker">Neighborhood Moments</div>
      <div class="gallery-venue">Close to Home</div>
    </div>
    <div class="gallery-thumbnail">
      <img src="/images/fvp-close-to-home-june/2025-07-17-fvp-close-to-home-june-060.jpg" alt="FVP Close to Home" class="gallery-thumb-img">
    </div>
  </a>
  
</div>

---

<div class="theme-controls">
  <button id="theme-toggle" class="theme-toggle-btn">
    <span class="theme-label">Night Mode</span>
  </button>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const themeToggle = document.getElementById('theme-toggle');
  const themeLabel = document.querySelector('.theme-label');
  
  // Load saved theme preference
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'flynn') {
    document.documentElement.setAttribute('data-theme', 'flynn');
    themeLabel.textContent = 'Light Mode';
  } else {
    document.documentElement.removeAttribute('data-theme');
    themeLabel.textContent = 'Night Mode';
  }
  
  themeToggle.addEventListener('click', function() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    
    if (currentTheme === 'flynn') {
      document.documentElement.removeAttribute('data-theme');
      themeLabel.textContent = 'Night Mode';
      localStorage.setItem('theme', 'light');
    } else {
      document.documentElement.setAttribute('data-theme', 'flynn');
      themeLabel.textContent = 'Light Mode';
      localStorage.setItem('theme', 'flynn');
    }
  });
});
</script>