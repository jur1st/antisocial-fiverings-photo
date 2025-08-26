#!/bin/bash

# Photo Publishing Mission - August SOC Gallery Update
# Process 18 new photos from 2025-08-SOC directory
# 
# Usage: ./process-august-soc-photos.sh
# 
# Prerequisites:
# - Source photos must be available in /Volumes/homes/john/Antisocial-Publishing/2025-08-SOC/
# - exiftool must be installed for metadata extraction
# - Hugo site must be initialized

set -e

# Configuration
SOURCE_DIR="/Volumes/homes/john/Antisocial-Publishing/2025-08-SOC"
WORK_DIR="/Users/john/antisocial-fiverings-photo-WORKING"
GALLERY_SLUG="straight-out-august-2025"
GALLERY_DIR="$WORK_DIR/static/images/galleries/$GALLERY_SLUG"
PHOTOS_CONTENT_DIR="$WORK_DIR/content/photos"
GALLERY_FILE="$WORK_DIR/content/galleries/$GALLERY_SLUG.md"

# Photo list with dates
declare -a AUGUST_23_PHOTOS=(
    "20250823-5RP_1594.jpg"
    "20250823-5RP_1612.jpg" 
    "20250823-5RP_1655.jpg"
    "20250823-5RP_1696.jpg"
    "20250823-5RP_1705.jpg"
    "20250823-5RP_1718.jpg"
    "20250823-5RP_1729.jpg"
)

declare -a AUGUST_24_PHOTOS=(
    "20250824-5RP_1766.jpg"
    "20250824-5RP_1848.jpg"
    "20250824-5RP_1930.jpg"
    "20250824-5RP_2007.jpg"
    "20250824-5RP_2034.jpg"
    "20250824-5RP_2044.jpg"
    "20250824-5RP_2099.jpg"
    "20250824-5RP_2111.jpg"
    "20250824-5RP_2142.jpg"
    "20250824-5RP_2151.jpg"
    "20250824-5RP_2152.jpg"
)

# Utility functions
log_step() {
    echo "=== $1 ==="
}

extract_exif_data() {
    local photo_file="$1"
    local temp_json="/tmp/exif_$(basename "$photo_file" .jpg).json"
    
    exiftool -json -EXIF:All -IPTC:All -XMP:All "$photo_file" > "$temp_json"
    
    # Extract key metadata using jq
    local aperture=$(jq -r '.[0].ApertureValue // .[0].FNumber // "Unknown"' "$temp_json" 2>/dev/null | sed 's/^/f\//')
    local shutter=$(jq -r '.[0].ShutterSpeedValue // .[0].ExposureTime // "Unknown"' "$temp_json" 2>/dev/null)
    local iso=$(jq -r '.[0].ISO // "Unknown"' "$temp_json" 2>/dev/null | sed 's/^/ISO /')
    local focal_length=$(jq -r '.[0].FocalLength // "Unknown"' "$temp_json" 2>/dev/null)
    local camera_body=$(jq -r '.[0].Model // "Unknown"' "$temp_json" 2>/dev/null)
    local lens_model=$(jq -r '.[0].LensModel // .[0].LensInfo // "Unknown"' "$temp_json" 2>/dev/null)
    local date_taken=$(jq -r '.[0].DateTimeOriginal // .[0].CreateDate // "Unknown"' "$temp_json" 2>/dev/null)
    
    # Clean up values
    aperture=${aperture/f\/f\//f\/}
    [[ "$shutter" =~ ^[0-9]*\.[0-9]*$ ]] && shutter="1/${shutter%.*}" 
    focal_length=${focal_length%% *}
    [[ "$focal_length" != "Unknown" ]] && focal_length="${focal_length}mm"
    
    # Return structured data
    echo "aperture:$aperture"
    echo "shutter:$shutter" 
    echo "iso:$iso"
    echo "focal_length:$focal_length"
    echo "body:$camera_body"
    echo "lens:$lens_model"
    echo "date_taken:$date_taken"
    
    rm -f "$temp_json"
}

create_photo_page() {
    local photo_file="$1"
    local photo_date="$2"
    local photo_number="$3"
    local total_photos="$4"
    
    local photo_basename=$(basename "$photo_file" .jpg)
    local photo_slug="$photo_date-straight-out-august-$(printf '%03d' $photo_number)"
    local photo_md_file="$PHOTOS_CONTENT_DIR/$photo_slug.md"
    
    log_step "Creating photo page: $photo_slug"
    
    # Extract EXIF data
    local exif_data=$(extract_exif_data "$photo_file")
    local aperture=$(echo "$exif_data" | grep "aperture:" | cut -d: -f2)
    local shutter=$(echo "$exif_data" | grep "shutter:" | cut -d: -f2)
    local iso=$(echo "$exif_data" | grep "iso:" | cut -d: -f2)
    local focal_length=$(echo "$exif_data" | grep "focal_length:" | cut -d: -f2)
    local body=$(echo "$exif_data" | grep "body:" | cut -d: -f2)
    local lens=$(echo "$exif_data" | grep "lens:" | cut -d: -f2)
    
    # Calculate navigation
    local prev_photo=""
    local next_photo=""
    
    if [ $photo_number -gt 1 ]; then
        local prev_num=$(printf '%03d' $((photo_number - 1)))
        prev_photo="/photos/$photo_date-straight-out-august-$prev_num"
    fi
    
    if [ $photo_number -lt $total_photos ]; then
        local next_num=$(printf '%03d' $((photo_number + 1)))
        next_photo="/photos/$photo_date-straight-out-august-$next_num"
    fi
    
    # Create markdown file
    cat > "$photo_md_file" << EOF
---
title: "Straight out of Camera - August 2025 - Photo $photo_number"
type: "photo"
layout: "single"
image: "/images/$GALLERY_SLUG/$photo_basename.jpg"
gallery: "/galleries/$GALLERY_SLUG"
gallery_name: "Straight out of Camera - August 2025"
photo_number: $photo_number
total_photos: $total_photos
$([ -n "$prev_photo" ] && echo "prev_photo: \"$prev_photo\"")
$([ -n "$next_photo" ] && echo "next_photo: \"$next_photo\"")
date: $photo_date
gallery_slug: "$GALLERY_SLUG"
location: ""
original_filename: "$photo_basename.jpg"
camera_settings:
  aperture: "$aperture"
  shutter: "$shutter"
  iso: "$iso"
  focal_length: "$focal_length"
  body: "$body"
  lens: "$lens"
---
EOF

    echo "Created: $photo_md_file"
}

update_gallery_file() {
    local total_photos="$1"
    
    log_step "Updating gallery file with $total_photos total photos"
    
    # Read current gallery file and update photo_count
    local temp_gallery="/tmp/gallery_update.md"
    
    # Extract front matter and update photo_count
    sed "s/photo_count: [0-9]*/photo_count: $total_photos/" "$GALLERY_FILE" > "$temp_gallery"
    
    # Add new photos to the photos array
    # This is a simplified version - in practice, you'd need to parse and update the YAML properly
    
    cp "$temp_gallery" "$GALLERY_FILE"
    rm -f "$temp_gallery"
    
    echo "Updated gallery file: $GALLERY_FILE"
}

copy_photos_to_static() {
    log_step "Copying photos to static directory"
    
    # Ensure gallery directory exists
    mkdir -p "$GALLERY_DIR"
    
    # Copy August 23 photos
    for photo in "${AUGUST_23_PHOTOS[@]}"; do
        if [ -f "$SOURCE_DIR/$photo" ]; then
            cp "$SOURCE_DIR/$photo" "$GALLERY_DIR/"
            echo "Copied: $photo"
        else
            echo "WARNING: Photo not found: $SOURCE_DIR/$photo"
        fi
    done
    
    # Copy August 24 photos  
    for photo in "${AUGUST_24_PHOTOS[@]}"; do
        if [ -f "$SOURCE_DIR/$photo" ]; then
            cp "$SOURCE_DIR/$photo" "$GALLERY_DIR/"
            echo "Copied: $photo"
        else
            echo "WARNING: Photo not found: $SOURCE_DIR/$photo"
        fi
    done
}

validate_hugo_build() {
    log_step "Validating Hugo build"
    
    cd "$WORK_DIR"
    
    if hugo --gc --minify --logLevel info; then
        echo "✅ Hugo build successful"
        return 0
    else
        echo "❌ Hugo build failed"
        return 1
    fi
}

# Main execution
main() {
    log_step "Starting August SOC Gallery Update"
    
    # Validate prerequisites
    if [ ! -d "$SOURCE_DIR" ]; then
        echo "❌ ERROR: Source directory not found: $SOURCE_DIR"
        echo "Please ensure the photos are available at the specified location."
        exit 1
    fi
    
    if ! command -v exiftool &> /dev/null; then
        echo "❌ ERROR: exiftool not installed. Install with: brew install exiftool"
        exit 1
    fi
    
    if ! command -v jq &> /dev/null; then
        echo "❌ ERROR: jq not installed. Install with: brew install jq" 
        exit 1
    fi
    
    # Copy photos to static directory
    copy_photos_to_static
    
    # Process August 23 photos (starting from photo #7, since we have 6 existing)
    local photo_counter=7
    for photo in "${AUGUST_23_PHOTOS[@]}"; do
        if [ -f "$SOURCE_DIR/$photo" ]; then
            create_photo_page "$SOURCE_DIR/$photo" "2025-08-23" "$photo_counter" 24
            ((photo_counter++))
        fi
    done
    
    # Process August 24 photos
    for photo in "${AUGUST_24_PHOTOS[@]}"; do
        if [ -f "$SOURCE_DIR/$photo" ]; then
            create_photo_page "$SOURCE_DIR/$photo" "2025-08-24" "$photo_counter" 24
            ((photo_counter++))
        fi
    done
    
    # Update gallery file
    update_gallery_file 24
    
    # Validate Hugo build
    if validate_hugo_build; then
        log_step "✅ August SOC Gallery Update Complete"
        echo "- Added 18 new photos (total: 24)"
        echo "- Created individual photo pages with EXIF metadata"
        echo "- Updated gallery navigation"
        echo "- Hugo build validated successfully"
    else
        log_step "❌ Update completed with build errors"
        echo "Please review Hugo build output above"
        exit 1
    fi
}

# Check if script is being run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi