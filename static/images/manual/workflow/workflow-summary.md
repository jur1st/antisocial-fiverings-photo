# Photography Workflow Documentation

## Complete Workflow: Camera → Website

### 1. Field Capture
- Nikon Z6III with WiFi enabled
- Consistent file naming
- GPS enabled for location data

### 2. Automated Upload
- Camera auto-connects to home WiFi
- Photos upload to Nikon Imaging Cloud
- Sync to Adobe Lightroom

### 3. Photo Organization
- Export from Lightroom to deliverables folder
- Maintain event folder structure
- Use standard naming convention

### 4. Import to Website
```bash
python import-photos.py /path/to/deliverables /path/to/website
```

### 5. Review & Publish
```bash
hugo server -D  # Preview locally
git add .       # Stage changes
git commit -m "Add gallery: Event Name"
git push        # Deploy
```

## Grid Intelligence Integration

Process photos for deeper insights:
```bash
cd /Users/john/Obsidian/The_Grid/00-Meta/04-Tools-Configs/04.02-Software
./grid_intelligence_command.sh image /path/to/photo.jpg "Project-Name"
```

## Key File Locations

- **Import Script**: `/Users/john/Obsidian/The_Grid/04-DarkoLabs/04.02-Software_Projects/Web-Publishing-Framework/scripts/import-photos.py`
- **Grid Intelligence**: `/Users/john/Obsidian/The_Grid/00-Meta/04-Tools-Configs/04.02-Software/grid_intelligence_command.sh`
- **Website Root**: `/Users/john/antisocial-gallery-enhancement/`

## Folder Naming Convention

```
YYYY-MM-DD - LOCATION - Event Name

Examples:
2025-07-17 - KC - Fountain View Photowalk
2025-06-10 - SECKC - Joe Grand Keynote
```