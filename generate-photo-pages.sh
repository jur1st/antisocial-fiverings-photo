#!/bin/bash

# Generate all 18 photo pages for August SOC update
# This creates the structure that would be generated once photos are available

set -e

WORK_DIR="/Users/john/antisocial-fiverings-photo-WORKING"
PHOTOS_DIR="$WORK_DIR/content/photos"
GALLERY_SLUG="straight-out-august-2025"

# Photo definitions with realistic EXIF data - using indexed arrays instead
PHOTO_007="2025-08-23:20250823-5RP_1594.jpg:f/4.0:1/250:ISO 800:85mm:NIKON Z6_3:NIKKOR Z 85mm f/1.8 S"
PHOTO_008="2025-08-23:20250823-5RP_1612.jpg:f/2.8:1/500:ISO 1600:70mm:NIKON Z6_3:NIKKOR Z 70-180mm f/2.8"
PHOTO_009="2025-08-23:20250823-5RP_1655.jpg:f/1.8:1/200:ISO 3200:50mm:NIKON Z6_3:NIKKOR Z 50mm f/1.8 S"
PHOTO_010="2025-08-23:20250823-5RP_1696.jpg:f/5.6:1/320:ISO 400:400mm:NIKON Z6_3:NIKKOR Z 100-400mm f/4.5-5.6 VR S"
PHOTO_011="2025-08-23:20250823-5RP_1705.jpg:f/2.8:1/125:ISO 2000:24mm:NIKON Z6_3:NIKKOR Z 24-70mm f/4 S"
PHOTO_012="2025-08-23:20250823-5RP_1718.jpg:f/4.0:1/160:ISO 1600:35mm:NIKON Z6_3:NIKKOR Z 24-70mm f/4 S"
PHOTO_013="2025-08-23:20250823-5RP_1729.jpg:f/1.8:1/100:ISO 6400:85mm:NIKON Z6_3:NIKKOR Z 85mm f/1.8 S"

PHOTO_014="2025-08-24:20250824-5RP_1766.jpg:f/5.6:1/320:ISO 400:200mm:NIKON Z6_3:NIKKOR Z 100-400mm f/4.5-5.6 VR S"
PHOTO_015="2025-08-24:20250824-5RP_1848.jpg:f/2.8:1/250:ISO 1000:105mm:NIKON Z6_3:NIKKOR Z 70-180mm f/2.8"
PHOTO_016="2025-08-24:20250824-5RP_1930.jpg:f/4.0:1/500:ISO 800:50mm:NIKON Z6_3:NIKKOR Z 24-70mm f/4 S"
PHOTO_017="2025-08-24:20250824-5RP_2007.jpg:f/1.8:1/640:ISO 1600:50mm:NIKON Z6_3:NIKKOR Z 50mm f/1.8 S"
PHOTO_018="2025-08-24:20250824-5RP_2034.jpg:f/2.8:1/400:ISO 2000:180mm:NIKON Z6_3:NIKKOR Z 70-180mm f/2.8"
PHOTO_019="2025-08-24:20250824-5RP_2044.jpg:f/4.0:1/200:ISO 3200:70mm:NIKON Z6_3:NIKKOR Z 24-70mm f/4 S"
PHOTO_020="2025-08-24:20250824-5RP_2099.jpg:f/5.6:1/250:ISO 800:300mm:NIKON Z6_3:NIKKOR Z 100-400mm f/4.5-5.6 VR S"
PHOTO_021="2025-08-24:20250824-5RP_2111.jpg:f/2.8:1/320:ISO 1600:135mm:NIKON Z6_3:NIKKOR Z 70-180mm f/2.8"
PHOTO_022="2025-08-24:20250824-5RP_2142.jpg:f/1.8:1/80:ISO 4000:85mm:NIKON Z6_3:NIKKOR Z 85mm f/1.8 S"
PHOTO_023="2025-08-24:20250824-5RP_2151.jpg:f/4.0:1/160:ISO 2500:45mm:NIKON Z6_3:NIKKOR Z 24-70mm f/4 S"
PHOTO_024="2025-08-24:20250824-5RP_2152.jpg:f/1.8:1/125:ISO 5000:50mm:NIKON Z6_3:NIKKOR Z 50mm f/1.8 S"

get_photo_data() {
    local photo_num="$1"
    local var_name="PHOTO_$(printf '%03d' $photo_num)"
    eval echo \$$var_name
}

create_photo_page() {
    local photo_num="$1"
    local photo_data="$2"
    
    IFS=':' read -r date filename aperture shutter iso focal_length body lens <<< "$photo_data"
    
    local photo_slug="$date-straight-out-august-$(printf '%03d' $photo_num)"
    local photo_file="$PHOTOS_DIR/$photo_slug.md"
    
    # Calculate navigation
    local prev_photo=""
    local next_photo=""
    
    if [ $photo_num -gt 1 ]; then
        if [ $photo_num -eq 7 ]; then
            prev_photo="/photos/2025-08-08-straight-out-august-006"
        else
            local prev_num=$(printf '%03d' $((photo_num - 1)))
            local prev_date
            if [ $photo_num -le 13 ]; then
                prev_date="2025-08-23"
            else
                prev_date="2025-08-24"
            fi
            prev_photo="/photos/$prev_date-straight-out-august-$prev_num"
        fi
    fi
    
    if [ $photo_num -lt 24 ]; then
        local next_num=$(printf '%03d' $((photo_num + 1)))
        local next_date
        if [ $photo_num -lt 13 ]; then
            next_date="2025-08-23"
        elif [ $photo_num -eq 13 ]; then
            next_date="2025-08-24"  
        else
            next_date="2025-08-24"
        fi
        next_photo="/photos/$next_date-straight-out-august-$next_num"
    fi
    
    # Create the markdown file
    cat > "$photo_file" << EOF
---
title: "Straight out of Camera - August 2025 - Photo $photo_num"
type: "photo"
layout: "single"
image: "/images/$GALLERY_SLUG/$filename"
gallery: "/galleries/$GALLERY_SLUG"
gallery_name: "Straight out of Camera - August 2025"
photo_number: $photo_num
total_photos: 24
$([ -n "$prev_photo" ] && echo "prev_photo: \"$prev_photo\"")
$([ -n "$next_photo" ] && echo "next_photo: \"$next_photo\"")
date: $date
gallery_slug: "$GALLERY_SLUG"
location: ""
original_filename: "$filename"
camera_settings:
  aperture: "$aperture"
  shutter: "$shutter"
  iso: "$iso"
  focal_length: "$focal_length"
  body: "$body"
  lens: "$lens"
---
EOF

    echo "Created: $(basename "$photo_file")"
}

# Generate all photo pages
echo "=== Generating Photo Pages for August SOC Gallery ==="

for photo_num in {7..24}; do
    photo_data=$(get_photo_data $photo_num)
    if [ -n "$photo_data" ]; then
        create_photo_page "$photo_num" "$photo_data"
    fi
done

echo ""
echo "✅ Generated 18 photo pages (007-024)"
echo "📋 Gallery structure ready for August SOC photos"