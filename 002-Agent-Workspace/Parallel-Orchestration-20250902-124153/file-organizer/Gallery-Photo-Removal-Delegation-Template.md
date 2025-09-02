# Gallery Photo Removal Delegation Template

## Mission Overview
Complete removal of specified photos from Hugo-based Antisocial Photography Platform, ensuring NO traces remain in the file system.

## 🚨 MANDATORY IMAGE FILE DELETION

**YOU MUST DELETE THESE FILES FOR EACH REMOVED PHOTO:**

### For Photo [XXX]: [filename]
- [ ] DELETE: `/content/photos/[gallery]-[XXX].md`
- [ ] DELETE: `/static/images/[gallery]/[filename].jpg`
- [ ] DELETE: `/public/images/[gallery]/[filename].jpg` (if exists)
- [ ] DELETE: `/resources/_gen/images/images/[gallery]/[filename]_hu*.webp` (all variants)
- [ ] CHECK: If photo 001, update homepage thumbnail in `/content/_index.md`

**VERIFICATION**: Run `find . -name "*[filename]*"` to ensure complete removal

## 📱 Homepage Thumbnail Update (CRITICAL)

**If removing photo 001 or gallery thumbnail photo:**
1. Identify current homepage thumbnail in `/content/_index.md`
2. Update to use the new first photo after removal/renumbering
3. Verify image exists before updating reference
4. Test homepage loads correctly with new thumbnail

## 🗂️ Complete File System Cleanup

**Photos exist in FIVE locations - ALL must be cleaned:**
- [ ] `/content/photos/[slug].md` - Individual photo pages
- [ ] `/content/galleries/[gallery].md` - Gallery photo entries  
- [ ] `/static/images/[gallery]/[img].jpg` - Source image files
- [ ] `/public/images/[gallery]/[img].jpg` - Generated copies
- [ ] `/resources/_gen/images/` - Processed variants and thumbnails

## Detailed Removal Protocol

### Phase 1: Content Structure Removal
1. **Remove Gallery Entry**
   - Open `/content/galleries/[gallery].md`
   - Remove the photo entry from the photos array
   - Update gallery photo count if displayed

2. **Remove Individual Photo Page**
   - DELETE: `/content/photos/[gallery]-[XXX].md`
   - Verify no other content references this file

### Phase 2: Image File Deletion
1. **Source Image Removal**
   ```bash
   rm "/static/images/[gallery]/[filename].jpg"
   ```

2. **Generated Image Cleanup**
   ```bash
   rm "/public/images/[gallery]/[filename].jpg" 2>/dev/null
   find ./resources/_gen/images -name "*[filename]*" -delete
   ```

3. **Hugo Cache Cleanup**
   ```bash
   hugo --gc  # Clean generated resources
   ```

### Phase 3: Renumbering (If Required)
**If removing photos from middle of sequence:**
1. Identify all photos with numbers > removed photo
2. Update each photo's:
   - Filename: `[gallery]-[new-number].md`
   - Content slug: `slug: "[gallery]-[new-number]"`
   - Image path in content
3. Update gallery.md photo array with new numbers
4. Move/rename image files to match new numbers

### Phase 4: Homepage Integration Check
**For photo 001 or featured photos:**
1. Check `/content/_index.md` for references
2. Update any hardcoded image paths
3. Verify featured photo selection logic
4. Test homepage rendering

## ✅ Complete Removal Verification

**Run these commands to verify complete removal:**
```bash
# Check for any remaining references
find . -name "*[removed-photo-filename]*"
grep -r "[removed-photo-filename]" content/
ls static/images/[gallery]/[removed-photo-filename]*

# Verify no broken links
hugo --renderToMemory --logLevel info 2>&1 | grep -i error

# Check generated files are clean
ls public/images/[gallery]/ | grep [removed-photo-filename]
find resources/_gen/images -name "*[removed-photo-filename]*"
```

**All commands should return EMPTY results for complete removal.**

## Post-Removal Quality Assurance

### Local Testing
1. **Build Site Locally**
   ```bash
   hugo server -D --disableFastRender
   ```
2. **Navigate to Gallery Page**
   - Verify removed photos don't appear
   - Check no broken image links
   - Confirm proper photo numbering
3. **Test Homepage**
   - Verify thumbnail loads correctly
   - Check featured content displays properly

### Production Verification
1. **Deploy Changes**
   ```bash
   git add .
   git commit -m "Remove [photo-description] from [gallery] gallery"
   git push origin main
   ```
2. **Monitor Deployment**
   - Check Netlify build logs for errors
   - Verify live site matches local testing
   - Test gallery navigation

## Common Failure Points to Avoid

### ❌ Critical Mistakes from Previous Operations
1. **Leaving image files in `/static/images/`** - Creates broken references
2. **Not updating homepage thumbnail** - Homepage shows missing image
3. **Ignoring Hugo cache** - Old generated files persist
4. **Incomplete grep verification** - Missing hidden references
5. **Not testing locally first** - Deployment breaks live site

### ⚠️ Special Considerations
1. **Photo 001 Removal**: Always requires homepage thumbnail update
2. **Featured Photos**: Check for hardcoded references in layouts
3. **Gallery Thumbnails**: Verify gallery cover image selection
4. **SEO Impact**: Update meta descriptions if removed photo was featured

## Delivery Requirements

### Immediate Deliverables
- [ ] Complete photo removal from all five file locations
- [ ] Updated gallery structure with proper numbering
- [ ] Homepage thumbnail verification/update
- [ ] Local testing confirmation
- [ ] Deployment readiness verification

### Documentation Package
- [ ] List of all files deleted
- [ ] Before/after gallery structure comparison
- [ ] Homepage changes summary (if applicable)
- [ ] Verification command results
- [ ] Local testing screenshots/confirmation

## Emergency Recovery Protocol

**If removal breaks the site:**
1. **Immediate Rollback**
   ```bash
   git revert HEAD --no-edit
   git push origin main
   ```
2. **Identify Issue**
   - Check build logs for specific errors
   - Verify image references in content
   - Test locally with reverted state
3. **Corrective Action**
   - Fix identified issues
   - Re-apply removal with corrections
   - Verify before deployment

## Success Metrics

### Technical Success
- [ ] Zero broken image links
- [ ] Zero build errors
- [ ] Zero missing file references
- [ ] Homepage displays correctly
- [ ] Gallery navigation works properly

### Business Success
- [ ] Removed photos no longer visible on live site
- [ ] Gallery maintains professional appearance
- [ ] Site performance unaffected
- [ ] SEO integrity maintained

## Template Usage Instructions

1. **Copy this template** for each removal operation
2. **Fill in specific details** for [gallery], [XXX], [filename]
3. **Execute each section sequentially** - don't skip ahead
4. **Document every deletion** for audit trail
5. **Test thoroughly** before considering complete

---

**CRITICAL REMINDER**: Photo removal is IRREVERSIBLE in production. Always maintain local backups and verify every step before deployment.

**Generated**: 2025-09-02 by File Organizer Agent  
**Based On**: America - No Kings removal operation lessons learned  
**Template Version**: 2.0 - Complete File System Cleanup