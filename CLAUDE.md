# CLAUDE.md - Antisocial Photography Platform

This file provides critical guidance to Claude Code when working with this photography platform repository.

## CRITICAL LESSONS FROM FAILURES

### The "No Kings Gallery" Disaster (2025-09-02)
A simple request to remove 20 photos turned into complete gallery corruption requiring total deletion. This failure destroyed user trust in our processes.

**Root Causes:**
1. **No Testing Infrastructure** - Changes deployed directly to production
2. **Smart Algorithms Created Corruption** - Renumbering logic created broken photo-to-image mappings
3. **Documentation Without Understanding** - Templates existed but weren't followed
4. **Multiple Failed Fixes** - Each "fix" made the problem worse

**What Must NEVER Happen Again:**
- ❌ Deploy without testing
- ❌ Create "smart" renumbering algorithms
- ❌ Assume agents will follow implicit requirements
- ❌ Push multiple fixes to production without validation

## MANDATORY REQUIREMENTS

### 1. Testing Before EVERY Deployment
```bash
# REQUIRED before any git push:
npm test                    # Run Playwright tests
npm run validate           # Run full validation
hugo server -D             # Manual local verification
```

### 2. File Operations Must Be Explicit
When removing photos, you MUST delete from ALL locations:
- `/content/photos/[gallery]-[XXX].md`
- `/content/galleries/[gallery].md` (photo entry)
- `/static/images/[gallery]/[filename].jpg`
- `/public/images/[gallery]/` (if exists)
- `/resources/_gen/images/` (all variants)

### 3. Homepage Updates Are MANDATORY
The homepage (`/content/_index.md`) MUST be updated when:
- Adding new galleries (add at TOP of gallery-grid)
- Removing galleries (remove entire block)
- Changing photo 001 (update thumbnail reference)

### 4. Conservative Language Required
- Say: "Implementation finished - awaiting validation"
- Never say: "Complete" or "Done" without user validation
- Always test locally before claiming success

## Repository Structure

```
/
├── .claude/                    # Agent configurations and templates
│   ├── hugo-assembly-agent.md  # Hugo component assembly instructions
│   └── templates/              # Operational templates
├── content/                    # Hugo content files
│   ├── _index.md              # Homepage (CRITICAL - handles gallery display)
│   ├── galleries/             # Gallery definitions
│   └── photos/                # Individual photo pages
├── static/                    # Static assets
│   ├── css/                   # Stylesheets
│   └── images/                # Photo files
├── layouts/                   # Hugo templates
├── tests/                     # Playwright test suites
│   ├── gallery.spec.ts        # Gallery operation tests
│   ├── navigation.spec.ts    # Navigation tests
│   └── images.spec.ts        # Image validation tests
└── public/                    # Generated site (git-ignored)
```

## Testing Infrastructure

### Available Test Commands
```bash
npm test                   # Run all tests
npm run test:gallery      # Test gallery operations
npm run test:navigation   # Test site navigation  
npm run test:images       # Validate all images
npm run test:ui           # Interactive test UI
npm run validate          # Full validation before deploy
```

### What Tests Validate
- ✅ All gallery thumbnails load
- ✅ Gallery navigation works
- ✅ No broken image links
- ✅ Photo counts match metadata
- ✅ All pages accessible
- ✅ Images optimized (<2MB)

## Gallery Operations Checklist

### Adding a Gallery
1. [ ] Create gallery in `/content/galleries/[name].md`
2. [ ] Add photos to `/content/photos/`
3. [ ] Add images to `/static/images/[gallery]/`
4. [ ] Update homepage `/content/_index.md` (add at TOP)
5. [ ] Run `npm test:gallery`
6. [ ] Verify locally with `hugo server -D`
7. [ ] Commit with descriptive message

### Removing Photos from Gallery
1. [ ] Use template: `.claude/templates/Gallery-Photo-Removal-Template-v2.md`
2. [ ] Delete photo markdown files
3. [ ] Delete image files from ALL locations
4. [ ] Update gallery.md photo array
5. [ ] Update homepage if photo 001
6. [ ] Run complete test suite
7. [ ] Verify no broken links locally
8. [ ] Commit only after validation passes

### Complete Gallery Removal
1. [ ] Remove gallery from `/content/galleries/`
2. [ ] Remove all photos from `/content/photos/`
3. [ ] Remove entire `/static/images/[gallery]/` directory
4. [ ] Update homepage to remove gallery block
5. [ ] Clean resources with `hugo --gc`
6. [ ] Run full test suite
7. [ ] Verify complete removal with grep/find
8. [ ] Commit with clear explanation

## Deployment Workflow

### Pre-Deployment Checklist
- [ ] All tests pass (`npm test`)
- [ ] Local server verified (`hugo server -D`)
- [ ] No broken links (`hugo --renderToMemory`)
- [ ] Homepage displays correctly
- [ ] Gallery navigation works

### Deployment Process
```bash
# 1. Test everything
npm run validate

# 2. Build and verify
hugo --minify
ls -la public/

# 3. Commit with clear message
git add .
git commit -m "Clear description of changes"

# 4. Deploy
git push origin main
# GitHub Actions handles deployment

# 5. Verify production
# Check https://antisocial.fiverings.photo/
```

## Emergency Recovery

### If Site Breaks in Production
```bash
# 1. Immediate rollback
git revert HEAD --no-edit
git push origin main

# 2. Investigate locally
git checkout HEAD~1
hugo server -D
npm test

# 3. Fix and re-test
# Make corrections
npm run validate
# Deploy only after validation
```

## Design System

### Flynn Theme (Tron Aesthetic)
- **Colors**: Nikon Yellow (#FFD700), Agent Orange (#FF8C00)
- **Typography**: Berkeley Mono (monospace), Crimson Text (serif)
- **Layout**: Responsive 1-7 column grid
- **Components**: Slide mount cards, minimal navigation

### Quality Standards
- Page load < 2 seconds
- Lighthouse score > 90
- All images < 2MB
- SSIM quality > 0.95

## Common Pitfalls to Avoid

1. **Never Assume** - Test everything explicitly
2. **No Clever Algorithms** - Simple and explicit over smart
3. **Document Reality** - What actually happens, not what should
4. **Test Before Deploy** - Every single time, no exceptions
5. **Preserve User Trust** - Better to delay than deploy broken

## Support Documentation

- Gallery operations: `.claude/templates/Gallery-Photo-Removal-Template-v2.md`
- Agent configs: `.claude/[agent-name].md`
- Test reports: `playwright-report/index.html`
- Build logs: GitHub Actions tab

## Contact

**Repository**: https://github.com/jur1st/antisocial-fiverings-photo
**Production**: https://antisocial.fiverings.photo/
**Issues**: Create in GitHub Issues with full reproduction steps

---

**Remember**: This platform has been through catastrophic failures. Every safeguard exists because something went horribly wrong. Respect the lessons learned.