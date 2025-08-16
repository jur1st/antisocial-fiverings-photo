---
title: "Photo Import Script"
description: "Documentation for the import-photos.py script that automates gallery creation with metadata extraction"
---

<nav class="nav-breadcrumb">
  <a href="/">Gallery Home</a>
  <span>/</span>
  <a href="/manual/">Owner's Manual</a>
  <span>/</span>
  <a href="/manual/technical-guide/">Technical Reference</a>
  <span>/</span>
  <span>Import Script</span>
</nav>

# Photo Import Script Documentation

The `import-photos.py` script automates the process of creating galleries, extracting metadata, and generating photo entries for your Hugo site.

## Overview

The import script handles:
- Gallery structure creation
- EXIF metadata extraction
- Photo entry generation
- Image optimization
- Automatic file organization

## Basic Usage

```bash
python import-photos.py --source ~/Pictures/Exports/EventName/ \
                       --gallery "event-name" \
                       --title "Event Full Name"
```

## Command Line Options

### Required Arguments

- `--source` or `-s`: Source directory containing photos to import
- `--gallery` or `-g`: Gallery slug (URL-friendly name)
- `--title` or `-t`: Human-readable gallery title

### Optional Arguments

- `--description` or `-d`: Gallery description text
- `--photographer`: Photographer name (defaults to config)
- `--date`: Override gallery date (defaults to today)
- `--featured`: Filename of featured image for gallery
- `--dry-run`: Preview actions without making changes
- `--verbose` or `-v`: Show detailed processing information

## Examples

### Basic Import

```bash
python import-photos.py --source ~/Pictures/2025/SecKC-July/ \
                       --gallery "seckc-july-2025" \
                       --title "SecKC July 2025 Meeting"
```

### Full Options

```bash
python import-photos.py --source ~/Pictures/2025/Downtown/ \
                       --gallery "downtown-walk-2025" \
                       --title "Downtown Photography Walk" \
                       --description "Evening exploration of the arts district" \
                       --photographer "John Doe" \
                       --date "2025-07-23" \
                       --featured "downtown-sunset-hero.jpg" \
                       --verbose
```

### Dry Run Testing

```bash
python import-photos.py --source ~/Pictures/Test/ \
                       --gallery "test-gallery" \
                       --title "Test Import" \
                       --dry-run
```

## What Gets Created

### Directory Structure

```
content/
├── galleries/
│   └── event-name/
│       └── _index.md          # Gallery index with metadata
└── photos/
    ├── event-name-001.md      # Individual photo entry
    ├── event-name-002.md      # Individual photo entry
    └── ...

static/
└── images/
    └── event-name/
        ├── event-name-001.jpg  # Processed photos
        ├── event-name-002.jpg
        └── ...
```

### Gallery Index Format

```markdown
---
title: "Event Full Name"
date: 2025-07-24
description: "Gallery description"
featured_image: "event-name-001.jpg"
photographer: "Your Name"
location: "Kansas City, MO"
---

Gallery introduction text here.
```

### Photo Entry Format

```markdown
---
title: "Photo Title"
date: 2025-07-24T14:30:00
gallery: "event-name"
image: "event-name-001.jpg"
camera: "Nikon Z6III"
lens: "NIKKOR Z 24-70mm f/2.8 S"
focal_length: "35mm"
aperture: "f/4"
shutter_speed: "1/125"
iso: "400"
gps_lat: "39.037222"
gps_lon: "-94.582222"
---

Optional photo description.
```

## Metadata Extraction

The script automatically extracts:

### Camera Information
- Make and model
- Lens information
- Serial numbers (if available)

### Exposure Settings
- Focal length
- Aperture (f-stop)
- Shutter speed
- ISO sensitivity

### Additional Data
- GPS coordinates (if available)
- Capture date/time
- Color space
- White balance
- Flash usage

## Image Processing

### Automatic Optimizations
- Preserves original quality
- Maintains color profiles
- Strips unnecessary metadata
- Generates web-optimized versions

### Naming Convention
Photos are renamed to maintain consistency:
```
Original: DSC_1234.NEF
Processed: event-name-001.jpg
```

## Integration with Grid Intelligence

After import, analyze the gallery:

```bash
# Create batch file for Grid Intelligence
ls static/images/event-name/*.jpg | \
  awk '{print "image|" $0 "|Event-Photo-" NR "-Analysis"}' > event_batch.txt

# Run Grid Intelligence
./grid_intelligence_command.sh batch event_batch.txt
```

## Configuration File

Create `.import-config.json` in your project root:

```json
{
  "default_photographer": "Your Name",
  "default_location": "Kansas City, MO",
  "image_quality": 90,
  "max_dimension": 3000,
  "preserve_gps": false,
  "copyright_notice": "© 2025 Your Name",
  "verbose": false
}
```

## Troubleshooting

### Common Issues

**"No photos found in source directory"**
- Check the path is correct
- Ensure photos are in supported formats (JPG, JPEG, PNG)
- Use `--verbose` to see what's being scanned

**"EXIF data not found"**
- Some photos may not have metadata
- Edited photos might have stripped EXIF
- Script continues with available data

**"Permission denied"**
- Check write permissions on content/ and static/ directories
- Ensure script has read access to source photos

### Debug Mode

```bash
python import-photos.py --source ~/Pictures/Problem/ \
                       --gallery "debug-test" \
                       --title "Debug Test" \
                       --verbose --dry-run
```

## Advanced Usage

### Batch Import Multiple Galleries

Create a batch import script:

```bash
#!/bin/bash
# batch-import.sh

python import-photos.py --source ~/Pictures/Event1/ --gallery "event-1" --title "Event One"
python import-photos.py --source ~/Pictures/Event2/ --gallery "event-2" --title "Event Two"
python import-photos.py --source ~/Pictures/Event3/ --gallery "event-3" --title "Event Three"
```

### Custom Metadata Processing

The script can be extended with custom processors:

```python
# In import-photos.py
def custom_metadata_processor(exif_data):
    # Add custom logic here
    return processed_data
```

## Best Practices

1. **Organize Before Import**
   - Cull photos in Lightroom first
   - Export at consistent quality
   - Use descriptive folder names

2. **Naming Conventions**
   - Use lowercase, hyphenated gallery names
   - Include dates for chronological ordering
   - Keep gallery names URL-friendly

3. **Metadata Preservation**
   - Export from Lightroom with metadata
   - Don't strip EXIF before import
   - Review GPS data privacy settings

4. **Post-Import Workflow**
   - Run Grid Intelligence analysis
   - Review generated entries
   - Add custom descriptions
   - Test locally before deploying

## Script Location

The import script is located at:
```
/Users/john/antisocial-gallery-enhancement/import-photos.py
```

Ensure you have Python 3.7+ and required dependencies:
```bash
pip install pillow pyyaml python-dateutil
```

---

The import script is a crucial component of the automated photography workflow, bridging the gap between photo processing and web publication while preserving rich metadata for Grid Intelligence analysis.