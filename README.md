# Antisocial Photography Platform

A professional photography portfolio at [antisocial.fiverings.photo](https://antisocial.fiverings.photo) - built with Hugo, locked to Flynn theme (Tron aesthetic), and designed with a photo-first philosophy.

## Philosophy

**Antisocial**: No social media integrations, no like buttons, no comments. Just photography on its own terms. The work speaks for itself without Silicon Valley's attention economy.

## Key Features

### Gallery Cards (Vertical Stack Layout)
- Photos as hero elements using full card width
- Progressive disclosure for camera metadata (hidden by default, shown on hover)
- Optimized for both landscape and portrait orientations
- Clean visual hierarchy with photo prominence

### Non-Sticky Header
- Static positioning for maximum viewport space
- Photos get full attention without persistent UI
- Better mobile experience with more vertical space
- Aligns with photo-first philosophy

### Flynn Theme Lock
- Dark surfaces with Nikon yellow (#FFD700) accents
- Tron-inspired aesthetic throughout
- Theme switcher hidden (permanently locked)
- Professional, consistent visual experience

## Local Development

```bash
# Start Hugo development server
hugo server

# With drafts
hugo server --buildDrafts

# Specific port
hugo server --port 1313
```

Site runs at http://localhost:1313/

## Deployment

Automatic deployment via GitHub Actions:
1. Push to `main` branch
2. GitHub Actions builds with Hugo
3. Deploys to GitHub Pages
4. Live at https://antisocial.fiverings.photo/

## Project Structure

```
├── content/          # Markdown content files
│   ├── events/      # Event photography (SecKC meetups)
│   ├── galleries/   # Photo collections
│   └── photos/      # Individual photo pages
├── layouts/         # Hugo templates
├── static/          
│   ├── css/        # Stylesheets (gallery.css is primary)
│   └── images/     # Photo assets
└── hugo.toml       # Hugo configuration
```

## Recent Improvements (2025-08-18)

### Gallery Transformation
- Changed from horizontal (photo left, text right) to vertical stack layout
- Photos now use 100% card width, eliminating empty space issues
- Portrait photos (like 009/Lina) properly showcased

### Progressive Disclosure
- Camera settings (f/2.8 • 1/250 • ISO 400) hidden by default
- Metadata appears on hover with subtle opacity
- Cleaner browsing experience without technical overwhelm

### Header De-Stickification
- Removed sticky positioning for photo-first viewing
- Eliminated backdrop blur for better performance
- More immersive gallery experience

## Configuration

### Hugo Settings (hugo.toml)
- Base URL: https://antisocial.fiverings.photo/
- Flynn theme permanently active
- Image optimization: 85% quality with Lanczos resampling

### CSS Architecture
- Primary stylesheet: `/static/css/gallery.css`
- CSS custom properties for theming
- Mobile-first responsive design
- Print styles included

## Support the Artist

If you enjoy these photographs, you can support the work:
- Venmo: @jbenson707
- Link available in site header

## Philosophy Notes

Every design decision prioritizes the photography:
- Minimal UI chrome
- No social features
- Clean, distraction-free viewing
- Performance over decoration
- Content over interface

---

Built with love for photography and disdain for social media's attention economy.

Licensed for viewing, not for redistribution without permission.