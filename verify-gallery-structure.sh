#!/bin/bash

# Gallery Structure Verification Script
# Validates the August SOC gallery implementation

set -e

WORK_DIR="/Users/john/antisocial-fiverings-photo-WORKING"
GALLERY_SLUG="straight-out-august-2025"

echo "=== Verifying August SOC Gallery Structure ==="
echo ""

# Check photo pages exist
echo "📄 Checking Photo Pages (001-024):"
missing_pages=0
for i in {1..24}; do
    num=$(printf '%03d' $i)
    
    # Determine expected date prefix
    if [ $i -le 2 ] || [ $i -eq 7 ] || [ $i -eq 8 ] || [ $i -eq 9 ] || [ $i -eq 10 ] || [ $i -eq 11 ] || [ $i -eq 12 ] || [ $i -eq 13 ]; then
        date_prefix="2025-08-23"
    elif [ $i -eq 3 ]; then
        date_prefix="2025-08-07" 
    elif [ $i -eq 4 ] || [ $i -eq 6 ]; then
        date_prefix="2025-08-08"
    elif [ $i -eq 5 ]; then
        date_prefix="2025-08-09"
    else
        date_prefix="2025-08-24"
    fi
    
    photo_file="$WORK_DIR/content/photos/$date_prefix-straight-out-august-$num.md"
    
    if [ -f "$photo_file" ]; then
        echo "  ✅ Photo $num: $(basename "$photo_file")"
    else
        echo "  ❌ Photo $num: MISSING - $photo_file"
        ((missing_pages++))
    fi
done

echo ""
echo "📊 Photo Pages Status:"
if [ $missing_pages -eq 0 ]; then
    echo "  ✅ All 24 photo pages present"
else
    echo "  ❌ $missing_pages photo pages missing"
fi

# Check gallery file
echo ""
echo "🗂️ Checking Gallery File:"
gallery_file="$WORK_DIR/content/galleries/$GALLERY_SLUG.md"
if [ -f "$gallery_file" ]; then
    photo_count=$(grep "photo_count:" "$gallery_file" | cut -d: -f2 | tr -d ' ')
    photos_in_yaml=$(grep -c "^- filename:" "$gallery_file" || echo "0")
    echo "  ✅ Gallery file exists: $(basename "$gallery_file")"
    echo "  📈 Photo count declared: $photo_count"
    echo "  📋 Photos in YAML: $photos_in_yaml"
    
    if [ "$photo_count" = "24" ] && [ "$photos_in_yaml" = "24" ]; then
        echo "  ✅ Gallery metadata consistent"
    else
        echo "  ❌ Gallery metadata inconsistent"
    fi
else
    echo "  ❌ Gallery file missing: $gallery_file"
fi

# Check Hugo build
echo ""
echo "🏗️ Testing Hugo Build:"
cd "$WORK_DIR"
if hugo --gc --quiet --logLevel error 2>/dev/null; then
    echo "  ✅ Hugo build successful"
    build_status="SUCCESS"
else
    echo "  ❌ Hugo build failed"
    build_status="FAILED"
fi

# Check navigation consistency
echo ""
echo "🧭 Checking Navigation Links:"
nav_issues=0

for file in content/photos/*straight-out-august*.md; do
    if [ -f "$file" ]; then
        # Extract photo number from filename
        photo_num=$(echo "$file" | grep -o 'august-[0-9][0-9][0-9]' | cut -d- -f2 | sed 's/^0*//')
        
        # Check for proper navigation
        if [ "$photo_num" -gt 1 ]; then
            if ! grep -q "prev_photo:" "$file"; then
                echo "  ❌ Missing prev_photo in photo $photo_num"
                ((nav_issues++))
            fi
        fi
        
        if [ "$photo_num" -lt 24 ]; then
            if ! grep -q "next_photo:" "$file"; then
                echo "  ❌ Missing next_photo in photo $photo_num"
                ((nav_issues++))
            fi
        fi
        
        # Check total_photos consistency
        if ! grep -q "total_photos: 24" "$file"; then
            echo "  ❌ Incorrect total_photos in photo $photo_num"
            ((nav_issues++))
        fi
    fi
done

if [ $nav_issues -eq 0 ]; then
    echo "  ✅ Navigation links consistent"
else
    echo "  ❌ $nav_issues navigation issues found"
fi

# Summary
echo ""
echo "========================================"
echo "📋 VERIFICATION SUMMARY"
echo "========================================"
echo "Photo Pages: $([ $missing_pages -eq 0 ] && echo "✅ PASS" || echo "❌ FAIL")"
echo "Gallery File: $([ -f "$gallery_file" ] && echo "✅ PASS" || echo "❌ FAIL")"
echo "Hugo Build: $([ "$build_status" = "SUCCESS" ] && echo "✅ PASS" || echo "❌ FAIL")"
echo "Navigation: $([ $nav_issues -eq 0 ] && echo "✅ PASS" || echo "❌ FAIL")"

if [ $missing_pages -eq 0 ] && [ -f "$gallery_file" ] && [ "$build_status" = "SUCCESS" ] && [ $nav_issues -eq 0 ]; then
    echo ""
    echo "🎉 ALL VERIFICATION CHECKS PASSED"
    echo "Gallery structure ready for production"
    echo ""
    echo "📋 Next Steps:"
    echo "1. Copy source photos to /static/images/galleries/straight-out-august-2025/"
    echo "2. Run ./process-august-soc-photos.sh (when photos available)"
    echo "3. Final Hugo build and deploy"
else
    echo ""
    echo "⚠️  VERIFICATION ISSUES DETECTED"
    echo "Please resolve issues before proceeding"
fi