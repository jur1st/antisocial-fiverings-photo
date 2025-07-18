// Theme switching functionality for antisocial.fiverings.photo
// Centralized theme management with localStorage persistence

document.addEventListener('DOMContentLoaded', function() {
  const themeToggle = document.getElementById('theme-toggle');
  const themeLabel = document.querySelector('.theme-label');
  
  // Defensive programming - ensure elements exist
  if (!themeToggle || !themeLabel) {
    console.warn('Theme toggle elements not found');
    return;
  }
  
  // Load saved theme preference on page load
  function loadTheme() {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'flynn') {
      document.documentElement.setAttribute('data-theme', 'flynn');
      themeLabel.textContent = 'Light Mode';
    } else {
      document.documentElement.removeAttribute('data-theme');
      themeLabel.textContent = 'Night Mode';
    }
  }
  
  // Toggle theme and update localStorage
  function toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    
    if (currentTheme === 'flynn') {
      // Switch to light mode
      document.documentElement.removeAttribute('data-theme');
      themeLabel.textContent = 'Night Mode';
      localStorage.setItem('theme', 'light');
    } else {
      // Switch to Flynn (dark) mode
      document.documentElement.setAttribute('data-theme', 'flynn');
      themeLabel.textContent = 'Light Mode';
      localStorage.setItem('theme', 'flynn');
    }
  }
  
  // Initialize theme on page load
  loadTheme();
  
  // Add click event listener
  themeToggle.addEventListener('click', toggleTheme);
});