---
title: "Component Showcase"
description: "Visual test page for all site components"
date: 2025-08-17
layout: "single"
---

# Component Showcase

This page displays every component used on the site to test visual consistency and identify missing styles.

## Typography System

### F-Stop Scale

<div class="typography-showcase">
  <h1 class="text-f56">f/5.6 - Largest Display (90px)</h1>
  <h2 class="text-f4">f/4.0 - Hero Display (64px)</h2>
  <h3 class="text-f28">f/2.8 - Large Heading (45px)</h3>
  <h4 class="text-f2">f/2.0 - Medium Heading (32px)</h4>
  <h5 class="text-f14">f/1.4 - Small Heading (23px)</h5>
  <p class="text-f1">f/1.0 - Body Text (16px)</p>
</div>

### Camera-Specific Typography

<div class="camera-model">NIKON Z6 III</div>
<div class="camera-specs">85mm • f/2.8 • 1/250s • ISO 400</div>
<div class="camera-description">Professional photography demands precision in every technical detail. This mathematical typography system ensures consistent visual hierarchy across all gallery presentations.</div>
<span class="tech-badge">Full Frame</span>
<span class="tech-badge">Mirrorless</span>

### Hero Elements

<h1 class="hero-title">Gallery Exhibition</h1>
<div class="hero-subtitle">Showcasing component architecture</div>

## Button Components

<div class="button-showcase">
  <button class="btn btn-primary">Primary Button</button>
  <button class="btn btn-secondary">Secondary Button</button>
  <button class="btn btn-primary btn-large">Large Primary</button>
  <a href="#" class="btn btn-secondary">Link Button</a>
</div>

## Navigation Components

### Breadcrumb Navigation
<nav class="nav-breadcrumb">
  <a href="/">Gallery Home</a>
  <span>/</span>
  <a href="/galleries/">Galleries</a>
  <span>/</span>
  <span>Current Page</span>
</nav>

### Photo Navigation
<div class="photo-nav">
  <a href="#" class="btn btn-secondary">← Previous</a>
  <div class="photo-counter">Photo 5 of 22</div>
  <a href="#" class="btn btn-secondary">Next →</a>
</div>

## Gallery Components

### Gallery Grid
<div class="gallery-grid">
  <a href="#" class="gallery-item">
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
  
  <a href="#" class="gallery-item">
    <div class="gallery-info">
      <div class="gallery-title">FVP Close to Home June</div>
      <div class="gallery-meta">July 17, 2025 • 62 Photos</div>
      <div class="gallery-speaker">Neighborhood Moments</div>
      <div class="gallery-venue">Close to Home</div>
    </div>
    <div class="gallery-thumbnail">
      <img src="/images/fvp-close-to-home-thumbnail.jpg" alt="FVP Close to Home" class="gallery-thumb-img">
    </div>
  </a>
</div>

### Gallery Image
<img src="/images/fvp-close-to-home-june/2025-07-17-fvp-close-to-home-june-001.jpg" alt="Sample photo" class="gallery-image">

## Photo Display Components

### Photo Container
<div class="photo-container">
  <img src="/images/fvp-close-to-home-june/2025-07-17-fvp-close-to-home-june-002.jpg" alt="Sample photo" class="photo-main">
</div>

### Camera Metadata Display
<div class="camera-metadata">
  <h3 class="metadata-title">Camera Settings</h3>
  
  <div class="metadata-section">
    <div class="metadata-grid">
      <div class="metadata-item metadata-exposure">
        <span class="metadata-label">Aperture</span>
        <span class="metadata-value aperture-value">f/2.8</span>
      </div>
      
      <div class="metadata-item metadata-exposure">
        <span class="metadata-label">Shutter Speed</span>
        <span class="metadata-value shutter-speed">1/125</span>
      </div>
      
      <div class="metadata-item metadata-exposure">
        <span class="metadata-label">ISO</span>
        <span class="metadata-value iso-value">ISO 400</span>
      </div>
    </div>
  </div>
  
  <div class="metadata-section">
    <div class="metadata-grid">
      <div class="metadata-item metadata-equipment">
        <span class="metadata-label">Camera</span>
        <span class="metadata-value camera-model">NIKON Z6 III</span>
      </div>
      
      <div class="metadata-item metadata-equipment">
        <span class="metadata-label">Lens</span>
        <span class="metadata-value focal-length">85mm f/1.8</span>
      </div>
    </div>
  </div>
</div>

## Contact Components

### Contact Container
<div class="contact-container">
  <div class="contact-photo-section">
    <img src="/images/contact/john-profile.jpg" alt="John Benson" class="contact-photo">
  </div>
  
  <div class="contact-info-section">
    <h2>Contact Information</h2>
    <a href="mailto:john@fiverings.photo" class="contact-email">john@fiverings.photo</a>
  </div>
</div>

## Error Components

### Error Display
<div class="error-container">
  <div class="error-camera-icon">📷</div>
  <div class="error-content">
    <h1 class="error-title">404</h1>
    <div class="error-code">Error Code: PAGE_NOT_FOUND</div>
    <p class="error-message">The requested image could not be located in the gallery archive.</p>
    <div class="error-suggestions">
      <a href="/" class="btn btn-primary">Return to Gallery</a>
    </div>
  </div>
</div>

## Page Layout Components

### Site Navigation
<div class="site-navigation-prominent">
  <a href="/about/" class="nav-link-prominent">About & Contact</a>
  <a href="/galleries/" class="nav-link-prominent">Galleries</a>
</div>

### Site Tagline
<div class="site-tagline">
An invitation-only gallery experience where the work speaks for itself.
</div>

### Fade In Animation
<div class="fade-in">
  <p>This content should fade in smoothly when the page loads.</p>
</div>

## Color Swatches

### Camera Theme (Current)
<div class="color-swatches">
  <div class="color-swatch" style="background: #FFD700;">Nikon Yellow</div>
  <div class="color-swatch" style="background: #000000; color: white;">Surface Base</div>
  <div class="color-swatch" style="background: #0a0a0a; color: white;">Surface Panel</div>
  <div class="color-swatch" style="background: #FF8C00;">Accent Secondary</div>
</div>

### Flynn Theme Colors
<div class="color-swatches">
  <div class="color-swatch" style="background: #00D4FF;">Tron Blue</div>
  <div class="color-swatch" style="background: #FF8C00;">Agent Orange</div>
  <div class="color-swatch" style="background: #0f0f0f; color: white;">Flynn Background</div>
</div>

---

**Test Instructions:**
1. View this page in all three themes (Light, Camera, Flynn)
2. Identify any broken styles or missing components
3. Note inconsistencies in spacing or typography
4. Verify all interactive elements work correctly