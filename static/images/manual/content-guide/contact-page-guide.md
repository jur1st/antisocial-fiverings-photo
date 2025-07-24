# Contact Page - Editing Guide

## File Location
```
/content/contact.md
```

## Editable Elements

### 1. Your Name
- **CSS Selector:** `h1`
- **Example Markdown:** `<h1>John Benson</h1>`

### 2. Contact Description
- **CSS Selector:** `.contact-details p`
- **Example Markdown:** `<p>For photo requests...</p>`

### 3. Email Link
- **CSS Selector:** `.contact-email`
- **Example Markdown:** `<a href="mailto:john@fiverings.photo">`

### 4. Social Links
- **CSS Selector:** `.social-link`
- **Example Markdown:** `<a href="https://..." target="_blank">`


## How to Edit

1. Open the file in your text editor:
   ```bash
   cd /Users/john/antisocial-gallery-enhancement
   edit /content/contact.md
   ```

2. Make your changes using Markdown syntax

3. Save the file

4. Hugo will automatically rebuild (if server is running)

5. Refresh your browser to see changes

## Markdown Quick Reference

```markdown
# H1 Heading
## H2 Heading
### H3 Heading

Regular paragraph text.

**Bold text**
*Italic text*
[Link text](https://example.com)

- Bullet list item
- Another item

1. Numbered list
2. Second item
```