# Gallery Metadata - Editing Guide

## File Location
```
/content/galleries/fvp-close-to-home-june.md
```

## Editable Elements

### 1. Gallery Title
- **CSS Selector:** `h1`
- **Example Markdown:** `title: "FVP Close to Home June"`

### 2. Gallery Description
- **CSS Selector:** `.gallery-description`
- **Example Markdown:** `Content after frontmatter`

### 3. Photo Count
- **CSS Selector:** `.photo-count`
- **Example Markdown:** `Automatic from photos array`


## How to Edit

1. Open the file in your text editor:
   ```bash
   cd /Users/john/antisocial-gallery-enhancement
   edit /content/galleries/fvp-close-to-home-june.md
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