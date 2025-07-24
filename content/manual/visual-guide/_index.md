---
title: "Visual Reference Guide"
description: "Complete visual documentation of all gallery components"
menu:
  main:
    parent: "Manual"
    name: "Visual Guide"
    weight: 10
---

<nav class="nav-breadcrumb">
  <a href="/">Gallery Home</a>
  <span>/</span>
  <a href="/manual/">Owner's Manual</a>
  <span>/</span>
  <span>Visual Reference</span>
</nav>

# Visual Reference Guide

This visual guide documents every design element in your gallery system. Click any section to explore the complete component library with screenshots from your actual gallery.

## Quick Access

<div class="visual-guide-grid">
  <a href="/manual/visual-guide/atomic-elements/" class="visual-guide-item">
    <div class="guide-icon">🎨</div>
    <h3>Atomic Elements</h3>
    <p>Typography, colors, spacing, and core design elements</p>
    <span class="item-count">6 screenshots</span>
  </a>
  
  <a href="/manual/visual-guide/page-types/" class="visual-guide-item">
    <div class="guide-icon">📄</div>
    <h3>Page Types</h3>
    <p>Every page in all three themes: Light, Camera, and Flynn</p>
    <span class="item-count">20 screenshots</span>
  </a>
  
  <a href="/manual/visual-guide/content-guide/" class="visual-guide-item">
    <div class="guide-icon">✏️</div>
    <h3>Content Guide</h3>
    <p>Editable areas with file paths and instructions</p>
    <span class="item-count">4 screenshots</span>
  </a>
  
  <a href="/manual/visual-guide/workflow/" class="visual-guide-item">
    <div class="guide-icon">🔄</div>
    <h3>Workflow Diagrams</h3>
    <p>Process flows and system architecture</p>
    <span class="item-count">3 diagrams</span>
  </a>
</div>

## Overview

This comprehensive visual documentation serves as your complete reference for:

- **Design Consistency**: See exactly how each element appears across themes
- **Content Editing**: Identify which files control each visual element
- **Theme Variations**: Compare Light, Camera, and Flynn modes side-by-side
- **Component Library**: Reference for maintaining visual consistency

## How to Use This Guide

1. **Browse by Category**: Click any section above to view related screenshots
2. **Click to Expand**: Each screenshot can be clicked for full-size viewing
3. **Cross-Theme Comparison**: See how elements adapt across themes
4. **File References**: Each editable area includes the exact file path

## Design Philosophy in Practice

These screenshots demonstrate the anti-social gallery principles:

- **Minimal Interface**: The design disappears so photos take center stage
- **Professional Typography**: F-stop based scale creates visual hierarchy
- **Theme Flexibility**: Three distinct moods without compromising usability
- **Performance First**: Clean, fast-loading components

<style>
.visual-guide-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 25px;
  margin: 40px 0;
}

.visual-guide-item {
  background: var(--surface-panel, #f8f8f8);
  border: 2px solid var(--border-color, #e0e0e0);
  border-radius: 12px;
  padding: 30px;
  text-decoration: none;
  color: inherit;
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.visual-guide-item:hover {
  transform: translateY(-4px);
  border-color: var(--accent-color, #FFD700);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.guide-icon {
  font-size: 48px;
  margin-bottom: 15px;
  display: block;
  filter: grayscale(0.2);
}

.visual-guide-item h3 {
  margin: 0 0 10px 0;
  font-size: 1.4rem;
  font-weight: 600;
}

.visual-guide-item p {
  margin: 0 0 15px 0;
  color: var(--text-secondary, #666);
  line-height: 1.5;
}

.item-count {
  display: inline-block;
  background: var(--accent-color, #FFD700);
  color: var(--text-inverse, #000);
  padding: 4px 12px;
  border-radius: 20px;
  font-size: 0.85rem;
  font-weight: 600;
}

/* Dark theme adjustments */
[data-theme="camera"] .visual-guide-item {
  background: #1a1a1a;
  border-color: #333;
}

[data-theme="camera"] .visual-guide-item:hover {
  border-color: #FFD700;
  box-shadow: 0 8px 20px rgba(255, 215, 0, 0.1);
}

/* Flynn theme adjustments */
[data-theme="flynn"] .visual-guide-item {
  background: #0f0f0f;
  border-color: #00D4FF;
}

[data-theme="flynn"] .visual-guide-item:hover {
  border-color: #FF8C00;
  box-shadow: 0 0 20px rgba(255, 140, 0, 0.3);
}

[data-theme="flynn"] .item-count {
  background: #00D4FF;
  color: #000;
  text-shadow: none;
}

[data-theme="flynn"] .guide-icon {
  filter: hue-rotate(180deg) brightness(1.2);
}

@media (max-width: 768px) {
  .visual-guide-grid {
    grid-template-columns: 1fr;
  }
  
  .visual-guide-item {
    padding: 20px;
  }
  
  .guide-icon {
    font-size: 36px;
  }
}
</style>