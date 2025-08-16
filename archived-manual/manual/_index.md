---
title: "Owner's Manual"
description: "Complete guide to operating your photography gallery website"
menu:
  main:
    name: "Manual"
    weight: 50
---

<nav class="nav-breadcrumb">
  <a href="/">Gallery Home</a>
  <span>/</span>
  <span>Owner's Manual</span>
</nav>

# Gallery Owner's Manual

Welcome to your comprehensive guide for operating the Antisocial Gallery system. This manual covers everything from basic operations to advanced customization.

## Quick Navigation

<div class="manual-nav-grid">
  <a href="#quick-start" class="manual-nav-item">
    <h3>Quick Start</h3>
    <p>Get up and running in minutes</p>
  </a>
  
  <a href="#photography-workflow" class="manual-nav-item">
    <h3>Photography Workflow</h3>
    <p>Camera to web process</p>
  </a>
  
  <a href="#content-management" class="manual-nav-item">
    <h3>Content Management</h3>
    <p>Edit and update your site</p>
  </a>
  
  <a href="/manual/visual-guide/" class="manual-nav-item">
    <h3>Visual Reference</h3>
    <p>Complete component library</p>
  </a>
  
  <a href="/manual/technical-guide/" class="manual-nav-item">
    <h3>Technical Guide</h3>
    <p>Grid Intelligence & Camera Systems</p>
  </a>
</div>

---

## Quick Start

### Essential Commands

<div class="command-reference">
  <div class="command-item">
    <h4>Start Local Server</h4>
    <pre><code>cd /Users/john/antisocial-gallery-enhancement
hugo server -D</code></pre>
  </div>
  
  <div class="command-item">
    <h4>Import Photos</h4>
    <pre><code>python import-photos.py /source/photos /path/to/site</code></pre>
  </div>
  
  <div class="command-item">
    <h4>Publish Changes</h4>
    <pre><code>git add .
git commit -m "Update gallery"
git push</code></pre>
  </div>
</div>

### Theme Selection

<div class="theme-demo">
  <p>Your gallery includes three themes. Click the button below to cycle through them:</p>
  <button class="theme-toggle-demo btn btn-primary">Try Theme Switching</button>
  <p class="current-theme">Current theme: <span id="current-theme-name">Camera</span></p>
</div>

The gallery ships with **Camera theme** as the default - a professional dark theme inspired by Nikon camera interfaces. Themes available:
- **Camera** (default): Dark professional photography theme with yellow accents
- **Light**: Bright gallery aesthetic with serif headers for elegant viewing
- **Flynn**: Monospace digital grid inspired by Tron's computer world

---

## Photography Workflow

### Grid Intelligence Integration

The gallery is powered by the **Grid Intelligence System** - a real tool built specifically for this project that analyzes photos, extracts metadata, and creates GPS projects for systematic content development.

**Key Features:**
- Automated metadata extraction from all photos
- Deep intelligence analysis for copywriting
- GPS project creation for task management
- Batch processing for entire galleries

Learn more: [Grid Intelligence Documentation](/manual/technical-guide/grid-intelligence/)

### Complete Process Flow

<div class="workflow-visual">
  <div class="workflow-step">
    <div class="step-number">1</div>
    <h4>Field Capture</h4>
    <p>Shoot with Nikon Z6III</p>
  </div>
  
  <div class="workflow-arrow">→</div>
  
  <div class="workflow-step">
    <div class="step-number">2</div>
    <h4>Auto Upload</h4>
    <p>WiFi to Lightroom</p>
  </div>
  
  <div class="workflow-arrow">→</div>
  
  <div class="workflow-step">
    <div class="step-number">3</div>
    <h4>Organize</h4>
    <p>Export deliverables</p>
  </div>
  
  <div class="workflow-arrow">→</div>
  
  <div class="workflow-step">
    <div class="step-number">4</div>
    <h4>Import & Analyze</h4>
    <p>Import + Grid Intelligence</p>
  </div>
  
  <div class="workflow-arrow">→</div>
  
  <div class="workflow-step">
    <div class="step-number">5</div>
    <h4>Publish</h4>
    <p>Git push to live</p>
  </div>
</div>

### Automated Camera Workflow

The Nikon Z6III is configured for automatic uploads:
1. **Shoot photos** during your event
2. **Return home** - camera connects to WiFi
3. **Auto-upload** to Nikon Cloud → Lightroom
4. **Process and export** from Lightroom
5. **Run import script** with metadata extraction

Detailed setup: [Camera Systems Documentation](/manual/technical-guide/camera-systems/)

### Folder Naming Convention

<div class="naming-example">
  <code>YYYY-MM-DD - LOCATION - Event Name</code>
  <p>Examples:</p>
  <ul>
    <li><code>2025-07-17 - KC - Fountain View Photowalk</code></li>
    <li><code>2025-06-10 - SECKC - Joe Grand Keynote</code></li>
  </ul>
</div>

---

## Content Management

### Editable Files

<div class="file-reference">
  <table>
    <thead>
      <tr>
        <th>Content</th>
        <th>File Location</th>
        <th>Format</th>
        <th>Edit Command</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>About Page</td>
        <td><code>/content/about.md</code></td>
        <td>Markdown</td>
        <td><a href="#" class="edit-link" data-file="/content/about.md">Edit</a></td>
      </tr>
      <tr>
        <td>Contact Info</td>
        <td><code>/content/contact.md</code></td>
        <td>HTML/Markdown</td>
        <td><a href="#" class="edit-link" data-file="/content/contact.md">Edit</a></td>
      </tr>
      <tr>
        <td>Galleries</td>
        <td><code>/content/galleries/*.md</code></td>
        <td>YAML/Markdown</td>
        <td><a href="#" class="edit-link" data-file="/content/galleries/">Browse</a></td>
      </tr>
    </tbody>
  </table>
</div>

---

## Visual Reference

### Theme Typography Systems

Each theme has its own carefully selected typography stack that reflects its character and purpose.

#### Camera Theme Typography (Default)
**Display Font:** DIN Next → Gotham → Futura PT → Univers → Akzidenz-Grotesk → Helvetica Neue → Arial  
**Reading Font:** Crimson Text → Georgia → Times New Roman  
**Technical Font:** Berkeley Mono → Terminus → Monaco → System Mono → Cascadia Code → Roboto Mono  
**Character:** Professional photography aesthetic with Nikon-inspired yellow accents on pure black backgrounds. Headers use lighter weights (300-400) with tighter letter-spacing for a refined, non-puffy appearance.

#### Light Theme Typography
**Display Font:** Crimson Text (serif) for all headers → Georgia → Times New Roman  
**Reading Font:** Crimson Text → Georgia → Times New Roman  
**Technical Font:** Same as Camera theme  
**Character:** Gallery aesthetic with stucco backgrounds and blue accents. Headers use serif typography for an elegant, editorial feel that complements the light viewing environment.

#### Flynn Theme Typography
**Display Font:** Berkeley Mono → Terminus → Monaco → System Mono → Menlo → Consolas → Courier New  
**Reading Font:** Berkeley Mono → Terminus → Monaco → System Mono → Menlo → Consolas → Courier New  
**Technical Font:** Berkeley Mono → Terminus → Monaco → System Mono → Menlo → Consolas → Courier New  
**Character:** Full monospace "digital grid" aesthetic inspired by Tron's computer world.

### Typography Scale (F-Stop System)

<div class="typography-demo">
  <h1 class="text-f4">F/4.0 - Main Titles (64px)</h1>
  <h2 class="text-f28">F/2.8 - Section Headers (45px)</h2>
  <h3 class="text-f2">F/2.0 - Subsections (32px)</h3>
  <h4 class="text-f14">F/1.4 - Components (23px)</h4>
  <p class="text-f1">F/1.0 - Body Text (16px)</p>
</div>

The typography scale follows the f-stop progression (√2 = 1.414), creating harmonious size relationships that mirror camera aperture settings.

### Color Palette

<div class="color-grid">
  <div class="color-swatch" style="background: #000000;">
    <span>Pure Black</span>
    <code>#000000</code>
  </div>
  <div class="color-swatch" style="background: #FFD700;">
    <span>Nikon Yellow</span>
    <code>#FFD700</code>
  </div>
  <div class="color-swatch" style="background: #00D4FF;">
    <span>Flynn Blue</span>
    <code>#00D4FF</code>
  </div>
  <div class="color-swatch" style="background: #FF8C00;">
    <span>Flynn Orange</span>
    <code>#FF8C00</code>
  </div>
</div>

### Component Examples

<div class="component-showcase">
  <h4>Buttons</h4>
  <div class="button-examples">
    <button class="btn btn-primary">Primary Button</button>
    <button class="btn btn-secondary">Secondary Button</button>
    <button class="btn btn-primary" disabled>Disabled Button</button>
  </div>
  
  <h4>Form Elements</h4>
  <div class="form-examples">
    <input type="text" placeholder="Text input example">
    <textarea placeholder="Textarea example"></textarea>
    <select>
      <option>Select option</option>
      <option>Option 2</option>
    </select>
  </div>
</div>

---

## Technical Details

### Performance Metrics

<div class="metrics-grid">
  <div class="metric">
    <h4>Build Time</h4>
    <p class="metric-value">&lt;400ms</p>
    <p class="metric-label">150+ pages</p>
  </div>
  <div class="metric">
    <h4>Page Size</h4>
    <p class="metric-value">&lt;34KB</p>
    <p class="metric-label">Total CSS+JS</p>
  </div>
  <div class="metric">
    <h4>Load Time</h4>
    <p class="metric-value">&lt;1.5s</p>
    <p class="metric-label">Fully interactive</p>
  </div>
  <div class="metric">
    <h4>Lighthouse</h4>
    <p class="metric-value">95+</p>
    <p class="metric-label">Performance score</p>
  </div>
</div>

### Mathematical Foundation

<div class="math-explanation">
  <h4>F-Stop Typography Scale</h4>
  <p>Based on √2 (1.414) progression:</p>
  <pre>
Base: 16px
f/1.0 = 16px
f/1.4 = 16px × 1.414 = 23px
f/2.0 = 23px × 1.414 = 32px
f/2.8 = 32px × 1.414 = 45px
f/4.0 = 45px × 1.414 = 64px
  </pre>
</div>

---

## Development Environment

### Running the Development Server

The gallery includes a custom development script that makes local testing easy:

<div class="command-item">
  <h4>Start Development Server</h4>
  <pre>./dev.sh</pre>
  <p>This starts Hugo on <code>http://localhost:8080/antisocial-fiverings-photo/</code> with automatic reload.</p>
</div>

<div class="command-item">
  <h4>Access from Mobile Devices</h4>
  <p>The dev server is accessible from any device on your network:</p>
  <pre>http://192.168.0.48:8080/antisocial-fiverings-photo/</pre>
  <p>Replace the IP with your computer's network address shown in the dev.sh output.</p>
</div>

### Development Configuration

The site uses two configuration files:
- **hugo.toml** - Production settings for GitHub Pages
- **hugo.dev.toml** - Development overrides for local testing

This ensures CSS and assets load correctly on both local network devices and the production site.

### Mobile Responsive Design

The gallery is fully responsive with specific breakpoints:
- **Mobile**: ≤ 640px (vertical button layout, larger touch targets)
- **Tablet**: 641px - 767px (compact horizontal layout)
- **Desktop**: 768px+ (full horizontal layout with optimal spacing)

Homepage navigation buttons meet WCAG accessibility standards with 44px minimum touch targets on mobile.

---

## Deployment

### GitHub Pages Setup

1. Push your changes to the main branch
2. GitHub Actions automatically builds and deploys the site
3. Access at: `https://[username].github.io/antisocial-fiverings-photo/`

### Custom Domain (Optional)

To use a custom domain like `antisocial.fiverings.photo`:
1. Add a CNAME file to the static folder
2. Configure DNS with your domain provider
3. Update baseURL in hugo.toml

---

## Technical Documentation

### Core Systems

<div class="tech-docs-grid">
  <a href="/manual/technical-guide/grid-intelligence/" class="tech-doc-item">
    <h4>🧠 Grid Intelligence System</h4>
    <p>Universal content analysis and GPS project creation</p>
  </a>
  
  <a href="/manual/technical-guide/camera-systems/" class="tech-doc-item">
    <h4>📷 Camera Systems & Automation</h4>
    <p>Z6III automated workflow and troubleshooting</p>
  </a>
  
  <a href="/manual/visual-guide/workflow/" class="tech-doc-item">
    <h4>🔄 Complete Workflow Guide</h4>
    <p>From camera to published gallery with intelligence</p>
  </a>
</div>

### Import Script Usage

<div class="command-item">
  <h4>Basic Import with Metadata</h4>
  <pre>python import-photos.py --source ~/Pictures/Exports/EventName/ \
                       --gallery "event-name" \
                       --title "Event Full Name"</pre>
</div>

<div class="command-item">
  <h4>Grid Intelligence Analysis</h4>
  <pre># After import, analyze gallery
./grid_intelligence_command.sh batch event_batch.txt

# Check created GPS project
ls -la /Users/john/Obsidian/The_Grid/04-DarkoLabs/04.01-Research_Projects/</pre>
</div>

---

## Additional Resources

<div class="resource-links">
  <a href="/manual/antisocial-gallery-manual-v1.0.pdf" class="resource-item">
    <h4>📄 Download PDF Manual</h4>
    <p>Complete 50+ page guide</p>
  </a>
  
  <a href="/manual/quick-reference-card.pdf" class="resource-item">
    <h4>📋 Quick Reference Card</h4>
    <p>Essential commands</p>
  </a>
  
  <a href="/manual/keyboard-shortcuts.pdf" class="resource-item">
    <h4>⌨️ Keyboard Shortcuts</h4>
    <p>Navigation guide</p>
  </a>
</div>

<!-- Styles moved to /css/manual-typography.css for better maintainability -->

<style>
.tech-docs-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: var(--space-4);
  margin: var(--space-6) 0;
}

.tech-doc-item {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: var(--space-4);
  text-decoration: none;
  transition: all 0.2s ease;
}

.tech-doc-item:hover {
  border-color: var(--color-accent);
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.tech-doc-item h4 {
  color: var(--color-heading);
  margin: 0 0 var(--space-2) 0;
}

.tech-doc-item p {
  color: var(--color-text-secondary);
  margin: 0;
  font-size: var(--text-sm);
}
</style>

<script>
// Theme toggle demo
document.addEventListener('DOMContentLoaded', function() {
  const toggleBtn = document.querySelector('.theme-toggle-demo');
  const themeDisplay = document.getElementById('current-theme-name');
  
  if (toggleBtn) {
    toggleBtn.addEventListener('click', function() {
      const themes = ['camera', 'flynn', 'light'];
      const currentTheme = document.documentElement.getAttribute('data-theme') || 'camera';
      const currentIndex = themes.indexOf(currentTheme);
      const nextIndex = (currentIndex + 1) % themes.length;
      const nextTheme = themes[nextIndex];
      
      if (nextTheme === 'camera') {
        document.documentElement.removeAttribute('data-theme');
      } else {
        document.documentElement.setAttribute('data-theme', nextTheme);
      }
      localStorage.setItem('preferred-theme', nextTheme);
      themeDisplay.textContent = nextTheme.charAt(0).toUpperCase() + nextTheme.slice(1);
    });
  }
  
  // Edit links
  document.querySelectorAll('.edit-link').forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      const file = this.getAttribute('data-file');
      alert(`To edit this file:\n\n1. Open your terminal\n2. Run: edit ${file}\n3. Save changes\n4. Refresh browser`);
    });
  });
});
</script>