---
title: "Content Guide"
description: "Editable areas with file paths and instructions"
---

<nav class="nav-breadcrumb">
  <a href="/">Gallery Home</a>
  <span>/</span>
  <a href="/manual/">Owner's Manual</a>
  <span>/</span>
  <a href="/manual/visual-guide/">Visual Reference</a>
  <span>/</span>
  <span>Content Guide</span>
</nav>

# Content Editing Guide

This visual guide shows you exactly where to edit content throughout your gallery. Each screenshot highlights editable areas with their corresponding file paths.

## Homepage Content

<div class="screenshot-gallery">
  <figure class="screenshot-item full-width">
    <img src="/images/manual/content-guide/homepage-editable-areas.png" 
         alt="Homepage editable areas highlighted"
         loading="lazy">
    <figcaption>
      <h4>Homepage Editable Areas</h4>
      <p>Main content file: <code>/content/_index.md</code></p>
      <div class="file-info">
        <h5>Editable Elements:</h5>
        <ul>
          <li><strong>Site Title</strong>: Edit in <code>hugo.toml</code></li>
          <li><strong>Tagline</strong>: Edit in <code>/content/_index.md</code></li>
          <li><strong>Gallery Links</strong>: Generated from <code>/content/galleries/</code></li>
          <li><strong>Navigation</strong>: Edit in <code>/content/_index.md</code></li>
        </ul>
      </div>
    </figcaption>
  </figure>
</div>

## Gallery Management

<div class="screenshot-gallery">
  <figure class="screenshot-item">
    <img src="/images/manual/content-guide/gallery-structure.png" 
         alt="Gallery file structure and editing"
         loading="lazy">
    <figcaption>
      <h4>Gallery Structure</h4>
      <p>Gallery files: <code>/content/galleries/*.md</code></p>
      <div class="file-info">
        <h5>Gallery Front Matter:</h5>
        <pre><code>---
title: "Gallery Name"
date: 2025-07-23
cover_image: "/images/gallery/cover.jpg"
description: "Gallery description"
---</code></pre>
      </div>
    </figcaption>
  </figure>
</div>

## Photo Metadata

<div class="screenshot-gallery">
  <figure class="screenshot-item">
    <img src="/images/manual/content-guide/photo-metadata-editing.png" 
         alt="Photo metadata and EXIF data"
         loading="lazy">
    <figcaption>
      <h4>Photo Metadata</h4>
      <p>Photo files: <code>/content/photos/*.md</code></p>
      <div class="file-info">
        <h5>Photo Front Matter:</h5>
        <pre><code>---
title: "Photo Title"
date: 2025-07-23
gallery: "/galleries/gallery-name/"
image: "/images/photos/photo.jpg"
camera_metadata:
  make: "Nikon"
  model: "Z6III"
  aperture: "f/2.8"
  shutter: "1/500"
  iso: "400"
---</code></pre>
      </div>
    </figcaption>
  </figure>
</div>

## Content Pages

<div class="screenshot-gallery">
  <figure class="screenshot-item">
    <img src="/images/manual/content-guide/content-pages-guide.png" 
         alt="About and Contact page editing"
         loading="lazy">
    <figcaption>
      <h4>Content Pages</h4>
      <p>Edit directly in markdown files</p>
      <div class="file-info">
        <h5>Page Locations:</h5>
        <ul>
          <li><strong>About</strong>: <code>/content/about.md</code></li>
          <li><strong>Contact</strong>: <code>/content/contact.md</code></li>
          <li><strong>Manual</strong>: <code>/content/manual/_index.md</code></li>
        </ul>
      </div>
    </figcaption>
  </figure>
</div>

## Quick Editing Guide

### Adding a New Gallery

1. Create a new file in `/content/galleries/`
2. Name it with URL-friendly format: `gallery-name.md`
3. Add front matter with title, date, and cover image
4. Add photos to `/content/photos/` with matching gallery reference

### Updating Photos

1. Images go in `/static/images/`
2. Create markdown file in `/content/photos/`
3. Include EXIF data in front matter
4. Reference parent gallery

### Site Configuration

**Global Settings**: `/hugo.toml`
```toml
baseURL = "https://antisocial.fiverings.photo"
title = "Five Rings Anti-Social Media"
[params]
  author = "John Benson"
  description = "An invitation-only gallery"
```

### Content Formatting

All content uses **Markdown** format:
- `# Heading 1` for main titles
- `## Heading 2` for sections
- `**bold**` for emphasis
- `[link text](url)` for links
- Standard markdown for lists, quotes, etc.

## File Organization Best Practices

### Naming Conventions
- **Galleries**: `YYYY-MM-DD-event-name.md`
- **Photos**: `YYYY-MM-DD-event-name-###.md`
- **Images**: Match photo markdown names

### Directory Structure
```
/content/
├── _index.md          # Homepage
├── about.md           # About page
├── contact.md         # Contact page
├── galleries/         # All galleries
│   └── *.md
├── photos/           # All photos
│   └── *.md
└── manual/           # This manual
    └── _index.md
```

### Image Storage
```
/static/images/
├── galleries/        # Gallery images
│   └── gallery-name/
│       └── *.jpg
├── contact/         # Profile images
└── manual/          # Documentation
```

<style>
.screenshot-gallery {
  margin: 30px 0;
}

.screenshot-item {
  margin: 0 0 30px 0;
  background: var(--surface-panel, #f8f8f8);
  border-radius: 8px;
  overflow: hidden;
  border: 1px solid var(--border-color, #e0e0e0);
}

.screenshot-item.full-width {
  max-width: 100%;
}

.screenshot-item img {
  width: 100%;
  height: auto;
  display: block;
}

.screenshot-item figcaption {
  padding: 25px;
}

.screenshot-item h4 {
  margin: 0 0 10px 0;
  font-size: 1.3rem;
  font-weight: 600;
}

.screenshot-item > figcaption > p {
  margin: 0 0 15px 0;
  font-family: var(--font-mono-enhanced, monospace);
  color: var(--accent-color, #FFD700);
}

.file-info {
  background: var(--code-bg-enhanced, #f5f5f5);
  padding: 20px;
  border-radius: 6px;
  margin-top: 15px;
}

.file-info h5 {
  margin: 0 0 10px 0;
  font-size: 1rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  opacity: 0.8;
}

.file-info ul {
  margin: 10px 0;
  padding-left: 20px;
}

.file-info li {
  margin: 5px 0;
  line-height: 1.6;
}

.file-info code {
  background: var(--surface-depth, #e0e0e0);
  padding: 2px 6px;
  border-radius: 3px;
  font-family: var(--font-mono-enhanced, monospace);
  font-size: 0.9em;
}

.file-info pre {
  margin: 10px 0 0 0;
  padding: 15px;
  background: var(--code-bg-enhanced, #1a1a1a);
  color: var(--code-text-enhanced, #e6e6e6);
  border-radius: 6px;
  overflow-x: auto;
  font-size: 0.9rem;
  line-height: 1.5;
}

.file-info pre code {
  background: transparent;
  padding: 0;
  color: inherit;
}

/* Dark theme adjustments */
[data-theme="camera"] .screenshot-item {
  background: #1a1a1a;
  border-color: #333;
}

[data-theme="camera"] .file-info {
  background: #0a0a0a;
}

[data-theme="camera"] .file-info code {
  background: #333;
  color: #FFD700;
}

/* Flynn theme adjustments */
[data-theme="flynn"] .screenshot-item {
  background: #0f0f0f;
  border-color: #00D4FF;
}

[data-theme="flynn"] .file-info {
  background: rgba(0, 212, 255, 0.05);
  border: 1px solid #00D4FF;
}

[data-theme="flynn"] .file-info code {
  background: rgba(0, 212, 255, 0.1);
  color: #00D4FF;
}

[data-theme="flynn"] .screenshot-item > figcaption > p {
  color: #00D4FF;
}

@media (max-width: 768px) {
  .file-info {
    padding: 15px;
  }
  
  .screenshot-item figcaption {
    padding: 20px;
  }
}
</style>