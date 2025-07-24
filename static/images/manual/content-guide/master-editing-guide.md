# Content Editing Master Guide

## Quick Reference

| Content Type | File Location | Format |
|-------------|---------------|---------|
| About Page | `/content/about.md` | Markdown |
| Contact Page | `/content/contact.md` | HTML in Markdown |
| Galleries | `/content/galleries/*.md` | YAML + Markdown |
| Events | `/content/events/*.md` | YAML + Markdown |

## Essential Commands

### View current content:
```bash
cat content/about.md
```

### Edit content:
```bash
# Using your preferred editor
code content/about.md      # VS Code
nano content/about.md      # Nano
vim content/about.md       # Vim
```

### Create new gallery:
```bash
# Copy template
cp content/galleries/template.md content/galleries/new-gallery.md
# Edit with your content
edit content/galleries/new-gallery.md
```

## Live Preview

With Hugo server running, changes are reflected immediately:
1. Edit file
2. Save
3. Browser auto-refreshes

## Markdown Cheat Sheet

### Text Formatting
- `**bold**` → **bold**
- `*italic*` → *italic*
- `[link](url)` → [link](url)

### Headers
- `# H1` - Largest
- `## H2` - Section
- `### H3` - Subsection

### Lists
```
- Bullet item
- Another item
  - Nested item

1. Numbered
2. List
3. Items
```

## Image References

Always use absolute paths from site root:
- ✅ `/images/galleries/my-photo.jpg`
- ❌ `images/galleries/my-photo.jpg`
- ❌ `./images/galleries/my-photo.jpg`
