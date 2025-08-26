#!/bin/bash

# EXIF Extraction Test Script for August SOC Photos
# Demonstrates metadata extraction workflow

set -e

# Test EXIF extraction with a sample image from the existing gallery
TEST_IMAGE="/Users/john/antisocial-fiverings-photo-WORKING/static/images/straight-out-august-2025/5RP_0840.jpg"

log_step() {
    echo "=== $1 ==="
}

extract_and_display_exif() {
    local image_file="$1"
    
    if [ ! -f "$image_file" ]; then
        echo "❌ Test image not found: $image_file"
        return 1
    fi
    
    log_step "Testing EXIF extraction on: $(basename "$image_file")"
    
    if ! command -v exiftool &> /dev/null; then
        echo "❌ exiftool not installed. Install with: brew install exiftool"
        return 1
    fi
    
    # Extract key EXIF data
    echo "📸 Camera Information:"
    exiftool -s -s -s -Make -Model "$image_file" | paste - - | while read make model; do
        echo "  Body: $make $model"
    done
    
    echo ""
    echo "🔧 Camera Settings:"
    
    local aperture=$(exiftool -s -s -s -ApertureValue -FNumber "$image_file" | head -1)
    local shutter=$(exiftool -s -s -s -ShutterSpeedValue -ExposureTime "$image_file" | head -1)  
    local iso=$(exiftool -s -s -s -ISO "$image_file")
    local focal_length=$(exiftool -s -s -s -FocalLength "$image_file")
    local lens=$(exiftool -s -s -s -LensModel -LensInfo "$image_file" | head -1)
    local date_taken=$(exiftool -s -s -s -DateTimeOriginal "$image_file")
    
    # Clean and format values
    [ -n "$aperture" ] && echo "  Aperture: f/$aperture"
    [ -n "$shutter" ] && echo "  Shutter Speed: $shutter"
    [ -n "$iso" ] && echo "  ISO: ISO $iso"
    [ -n "$focal_length" ] && echo "  Focal Length: $focal_length"
    [ -n "$lens" ] && echo "  Lens: $lens"
    [ -n "$date_taken" ] && echo "  Date Taken: $date_taken"
    
    echo ""
    echo "📊 Technical Details:"
    exiftool -s -s -s -ImageWidth -ImageHeight -ColorSpace "$image_file" | while read width height colorspace; do
        echo "  Dimensions: ${width}x${height}"
        echo "  Color Space: $colorspace"
    done
    
    echo ""
    log_step "EXIF extraction test complete"
    
    return 0
}

# Test with sample photo if available
if extract_and_display_exif "$TEST_IMAGE"; then
    echo "✅ EXIF extraction workflow validated"
    echo ""
    echo "📋 Next Steps:"
    echo "1. Ensure source photos are available at: /Volumes/homes/john/Antisocial-Publishing/2025-08-SOC/"
    echo "2. Run: ./process-august-soc-photos.sh"
    echo "3. Validate Hugo build"
else
    echo "❌ EXIF extraction test failed"
    echo "Please check exiftool installation and image availability"
fi