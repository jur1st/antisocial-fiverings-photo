# About Page - Editing Guide

## File Location
```
/content/about.md
```

## Editable Elements

### 1. Page Title
- **CSS Selector:** `main h1`
- **Example Markdown:** `title: "About"`

### 2. Body Content
- **CSS Selector:** `main p`
- **Example Markdown:** `Markdown paragraphs`

### 3. Section Headers
- **CSS Selector:** `main h2`
- **Example Markdown:** `## Philosophy & Approach`

### 4. Lists
- **CSS Selector:** `main ul`
- **Example Markdown:** `- List item`


## How to Edit

1. Open the file in your text editor:
   ```bash
   cd /Users/john/antisocial-gallery-enhancement
   edit /content/about.md
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