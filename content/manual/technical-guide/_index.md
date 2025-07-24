---
title: "Technical Guide"
description: "In-depth technical documentation for Grid Intelligence and Camera Systems"
---

<nav class="nav-breadcrumb">
  <a href="/">Gallery Home</a>
  <span>/</span>
  <a href="/manual/">Owner's Manual</a>
  <span>/</span>
  <span>Technical Guide</span>
</nav>

# Technical Guide

Deep technical documentation for the systems that power your photography workflow.

## Core Systems

<div class="tech-guide-grid">
  <a href="/manual/technical-guide/grid-intelligence/" class="tech-guide-card">
    <div class="card-icon">🧠</div>
    <h3>Grid Intelligence System</h3>
    <p>The intelligence multiplication engine built specifically for this project. Analyzes photos, extracts metadata, creates GPS projects, and provides deep insights for copywriting and curation.</p>
    <ul>
      <li>Image analysis and metadata extraction</li>
      <li>Batch gallery processing</li>
      <li>GPS project creation</li>
      <li>Strategic intelligence reports</li>
    </ul>
  </a>

  <a href="/manual/technical-guide/camera-systems/" class="tech-guide-card">
    <div class="card-icon">📷</div>
    <h3>Camera Systems & Automation</h3>
    <p>Complete guide to the Nikon Z6III automated workflow that eliminates manual card dumping through WiFi uploads to cloud services.</p>
    <ul>
      <li>Z6III configuration guide</li>
      <li>Nikon Imaging Cloud setup</li>
      <li>Lightroom integration</li>
      <li>Troubleshooting guide</li>
    </ul>
  </a>
</div>

## Quick Command Reference

### Grid Intelligence Commands

```bash
# Single image analysis
./grid_intelligence_command.sh image "photo.jpg" "Analysis-Name"

# Batch gallery processing  
./grid_intelligence_command.sh batch "gallery_list.txt"

# System status check
./grid_intelligence_command.sh status

# Help and available commands
./grid_intelligence_command.sh help
```

### Import Script Commands

```bash
# Basic import with metadata extraction
python import-photos.py --source ~/Pictures/Exports/Event/ \
                       --gallery "event-name" \
                       --title "Event Name"

# Import with custom settings
python import-photos.py --source ~/Pictures/Exports/Event/ \
                       --gallery "event-name" \
                       --title "Event Name" \
                       --photographer "Your Name" \
                       --description "Event description"
```

## System Integration

The technical systems work together to create an intelligent photography workflow:

```
Camera → Cloud → Lightroom → Export → Import Script → Grid Intelligence → GPS Projects → Hugo → GitHub
```

Each component is designed to:
- **Reduce manual work** through automation
- **Extract maximum value** from every photo
- **Create actionable intelligence** for content development
- **Maintain professional quality** throughout the pipeline

## Related Documentation

- [Complete Workflow Guide](/manual/visual-guide/workflow/) - Step-by-step process documentation
- [Visual Reference Guide](/manual/visual-guide/) - Component library and UI patterns
- [Main Owner's Manual](/manual/) - General operation guide

<style>
.tech-guide-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  gap: var(--space-6);
  margin: var(--space-6) 0;
}

.tech-guide-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-6);
  text-decoration: none;
  transition: all 0.3s ease;
  display: block;
}

.tech-guide-card:hover {
  border-color: var(--color-accent);
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
}

.card-icon {
  font-size: 3rem;
  margin-bottom: var(--space-4);
}

.tech-guide-card h3 {
  color: var(--color-heading);
  margin: 0 0 var(--space-3) 0;
}

.tech-guide-card p {
  color: var(--color-text);
  margin: 0 0 var(--space-4) 0;
  line-height: 1.6;
}

.tech-guide-card ul {
  margin: 0;
  padding-left: var(--space-4);
  color: var(--color-text-secondary);
}

.tech-guide-card li {
  margin: var(--space-1) 0;
}

pre {
  background: var(--color-code-bg);
  padding: var(--space-4);
  border-radius: var(--radius-md);
  overflow-x: auto;
}

code {
  font-family: var(--font-technical);
}
</style>