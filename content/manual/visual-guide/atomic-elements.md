---
title: "Atomic Elements"
description: "Typography, colors, spacing, and core design elements"
---

<nav class="nav-breadcrumb">
  <a href="/">Gallery Home</a>
  <span>/</span>
  <a href="/manual/">Owner's Manual</a>
  <span>/</span>
  <a href="/manual/visual-guide/">Visual Reference</a>
  <span>/</span>
  <span>Atomic Elements</span>
</nav>

# Atomic Elements

The foundation of your gallery's visual system, based on mathematical principles and photographic metaphors.

## Typography Hierarchy

<div class="screenshot-gallery">
  <figure class="screenshot-item">
    <img src="/images/manual/atomic-elements/typography-hierarchy.png" 
         alt="Typography system showing f-stop scale"
         loading="lazy">
    <figcaption>
      <h4>F-Stop Typography Scale</h4>
      <p>Based on √2 (1.414) progression matching camera aperture values</p>
    </figcaption>
  </figure>
</div>

### Implementation Details

The typography system uses camera f-stop values as size ratios:
- **f/4.0** = 64px - Hero titles, main gallery names
- **f/2.8** = 45px - Section headers  
- **f/2.0** = 32px - Subsection headers
- **f/1.4** = 23px - Component titles
- **f/1.0** = 16px - Body text baseline

## Color Palette

<div class="screenshot-gallery">
  <figure class="screenshot-item">
    <img src="/images/manual/atomic-elements/color-palette.png" 
         alt="Color system across three themes"
         loading="lazy">
    <figcaption>
      <h4>Theme Color Systems</h4>
      <p>Light, Camera, and Flynn modes with their distinct palettes</p>
    </figcaption>
  </figure>
</div>

### Color Values

**Light Theme**
- Background: `#FFFFFF`
- Text: `#1a1a1a`
- Accent: `#FFD700` (Nikon Yellow)

**Camera Theme**
- Background: `#000000`
- Text: `#FFFFFF`
- Accent: `#FFD700`

**Flynn Theme**
- Background: `#0f0f0f`
- Primary: `#00D4FF` (Tron Blue)
- Secondary: `#FF8C00` (Agent Orange)

## Spacing System

<div class="screenshot-gallery">
  <figure class="screenshot-item">
    <img src="/images/manual/atomic-elements/spacing-system.png" 
         alt="8px baseline grid spacing"
         loading="lazy">
    <figcaption>
      <h4>8px Baseline Grid</h4>
      <p>Harmonic spacing intervals for consistent rhythm</p>
    </figcaption>
  </figure>
</div>

### Spacing Scale
- `8px` - Base unit
- `16px` - Paragraph spacing
- `24px` - Section spacing  
- `32px` - Component spacing
- `48px` - Major sections
- `64px` - Page sections

## Interactive Elements

<div class="screenshot-gallery">
  <figure class="screenshot-item">
    <img src="/images/manual/atomic-elements/interactive-elements.png" 
         alt="Buttons, forms, and interactive components"
         loading="lazy">
    <figcaption>
      <h4>Interactive Components</h4>
      <p>Buttons, form elements, and navigation in all themes</p>
    </figcaption>
  </figure>
</div>

## Navigation Elements

<div class="screenshot-gallery">
  <figure class="screenshot-item">
    <img src="/images/manual/atomic-elements/breadcrumb-navigation.png" 
         alt="Breadcrumb navigation system"
         loading="lazy">
    <figcaption>
      <h4>Breadcrumb Navigation</h4>
      <p>Hierarchical navigation for gallery and photo pages</p>
    </figcaption>
  </figure>
</div>

## Complete Reference

<div class="screenshot-gallery">
  <figure class="screenshot-item full-width">
    <img src="/images/manual/atomic-elements/complete-atomic-elements.png" 
         alt="All atomic elements in one view"
         loading="lazy">
    <figcaption>
      <h4>Complete Atomic Elements Reference</h4>
      <p>All core design elements in a single comprehensive view</p>
    </figcaption>
  </figure>
</div>

## Usage Guidelines

### Typography
- Headers use display font stack (system fonts)
- Body text uses reading font (Crimson Text)
- Technical data uses monospace (JetBrains Mono)
- All sizes follow f-stop progression

### Colors
- Maintain high contrast ratios (WCAG AA)
- Use theme-aware CSS variables
- Accent colors for interactive elements only
- Preserve photographic focus

### Spacing
- Follow 8px grid strictly
- Use consistent padding/margins
- Maintain visual rhythm
- Create breathing room for photos

<style>
.screenshot-gallery {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
  margin: 40px 0;
}

.screenshot-item {
  margin: 0;
  background: var(--surface-panel, #f8f8f8);
  border-radius: 8px;
  overflow: hidden;
  border: 1px solid var(--border-color, #e0e0e0);
  transition: all 0.3s ease;
}

.screenshot-item:hover {
  transform: scale(1.02);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.screenshot-item.full-width {
  grid-column: 1 / -1;
}

.screenshot-item img {
  width: 100%;
  height: auto;
  display: block;
  cursor: zoom-in;
}

.screenshot-item figcaption {
  padding: 20px;
}

.screenshot-item h4 {
  margin: 0 0 8px 0;
  font-size: 1.1rem;
  font-weight: 600;
}

.screenshot-item p {
  margin: 0;
  color: var(--text-secondary, #666);
  font-size: 0.95rem;
  line-height: 1.5;
}

/* Dark theme adjustments */
[data-theme="camera"] .screenshot-item {
  background: #1a1a1a;
  border-color: #333;
}

[data-theme="camera"] .screenshot-item:hover {
  box-shadow: 0 8px 20px rgba(255, 215, 0, 0.1);
}

/* Flynn theme adjustments */
[data-theme="flynn"] .screenshot-item {
  background: #0f0f0f;
  border-color: #00D4FF;
}

[data-theme="flynn"] .screenshot-item:hover {
  border-color: #FF8C00;
  box-shadow: 0 0 20px rgba(255, 140, 0, 0.3);
}

/* Lightbox effect (basic) */
.screenshot-item img:active {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) scale(0.95);
  max-width: 90vw;
  max-height: 90vh;
  z-index: 1000;
  cursor: zoom-out;
  box-shadow: 0 0 0 100vmax rgba(0, 0, 0, 0.8);
}

@media (max-width: 768px) {
  .screenshot-gallery {
    grid-template-columns: 1fr;
  }
}
</style>