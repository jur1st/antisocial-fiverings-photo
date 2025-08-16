# Domain Architecture - Five Rings Photography

**Date**: 2025-08-16  
**Purpose**: Document SSL fix and domain configuration  

## Domain Structure

### Primary Domain
- **Domain**: fiverings.photo
- **Purpose**: Main brand domain
- **Current State**: Placeholder with redirect
- **Hosting**: GitHub Pages

### Subdomain
- **Domain**: antisocial.fiverings.photo
- **Purpose**: Active photography gallery
- **Current State**: Fully operational
- **Platform**: Hugo static site

## SSL Configuration

### Certificate Provider
- **Provider**: GitHub Pages (Let's Encrypt)
- **Type**: Automatic SSL/TLS
- **Renewal**: Automatic via GitHub Pages
- **Verification**: HTTP-01 challenge

### DNS Configuration Required
For fiverings.photo to work with GitHub Pages SSL:

1. **A Records** (point to GitHub Pages servers):
   - 185.199.108.153
   - 185.199.109.153
   - 185.199.110.153
   - 185.199.111.153

2. **CNAME Record** (if using www):
   - www.fiverings.photo → jur1st.github.io

## Redirect Implementation

### Method
HTML meta refresh (0 second delay)

### Rationale
- Simple and reliable
- No JavaScript required
- Works with GitHub Pages
- Maintains SEO value via canonical link

### Code
```html
<meta http-equiv="refresh" content="0; url=https://antisocial.fiverings.photo">
<link rel="canonical" href="https://antisocial.fiverings.photo">
```

## GitHub Pages Configuration

### Repository Settings
1. Navigate to Settings → Pages
2. Source: Deploy from branch
3. Branch: `fix/ssl-placeholder` (temporarily) then `main`
4. Folder: / (root)
5. Custom domain: fiverings.photo
6. Enforce HTTPS: ✓ Enabled

### File Structure
```
/
├── index.html    # Redirect placeholder
├── CNAME         # Domain configuration
└── DOMAIN-ARCHITECTURE.md  # This documentation
```

## Deployment Process

1. **Create Branch**: `fix/ssl-placeholder`
2. **Add Files**: index.html, CNAME
3. **Push to GitHub**: Triggers GitHub Pages build
4. **DNS Propagation**: May take up to 24 hours
5. **SSL Provisioning**: Automatic after DNS verified
6. **Merge to Main**: After validation

## Testing Checklist

- [ ] fiverings.photo loads without SSL warnings
- [ ] Automatic redirect to antisocial.fiverings.photo
- [ ] Mobile responsive placeholder
- [ ] All major browsers tested
- [ ] DNS properly configured
- [ ] SSL certificate valid

## Future Considerations

When ready to deploy full site to fiverings.photo:
1. Remove redirect from index.html
2. Deploy full Hugo build
3. Update DNS if needed
4. Maintain SSL continuity

## Troubleshooting

### SSL Certificate Errors
- Verify DNS A records
- Check CNAME file exists
- Wait for DNS propagation
- Confirm GitHub Pages settings

### Redirect Not Working
- Clear browser cache
- Check meta refresh syntax
- Verify target URL

---

**Status**: Implementation finished - awaiting validation  
**Next Step**: Push to GitHub and monitor SSL provisioning