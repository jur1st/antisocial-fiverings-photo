import { test, expect } from '@playwright/test';

test.describe('Gallery Thumbnail Tests', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('landing page thumbnails should completely fill frames (no black margins)', async ({ page }) => {
    // Wait for gallery grid to be visible
    await expect(page.locator('.gallery-grid')).toBeVisible();
    
    // Get all landing gallery thumbnails
    const thumbnails = page.locator('.landing-gallery-thumb');
    const count = await thumbnails.count();
    
    expect(count).toBeGreaterThan(0);
    
    for (let i = 0; i < count; i++) {
      const thumbnail = thumbnails.nth(i);
      
      // Verify thumbnail is visible
      await expect(thumbnail).toBeVisible();
      
      // Get computed styles to verify object-fit is working
      const objectFit = await thumbnail.evaluate((img) => {
        return window.getComputedStyle(img).objectFit;
      });
      
      // Should be 'cover' to fill the frame completely
      expect(objectFit).toBe('cover');
      
      // Verify the image has loaded
      const naturalWidth = await thumbnail.evaluate((img: HTMLImageElement) => img.naturalWidth);
      expect(naturalWidth).toBeGreaterThan(0);
      
      // Check that height is set correctly
      const height = await thumbnail.evaluate((img) => {
        return window.getComputedStyle(img).height;
      });
      
      // Should be 180px or appropriate responsive height
      expect(parseInt(height)).toBeGreaterThanOrEqual(120);
      
      // Verify no black background is showing through
      const backgroundColor = await thumbnail.evaluate((img) => {
        const parent = img.parentElement;
        return parent ? window.getComputedStyle(parent).backgroundColor : 'none';
      });
      
      // Log for debugging
      console.log(`Thumbnail ${i}: objectFit=${objectFit}, height=${height}, bg=${backgroundColor}`);
    }
  });

  test('portrait images should be used for landing page thumbnails', async ({ page }) => {
    const expectedPortraits = [
      '20250901-5RP_4254.jpg', // Labor Day Rally
      '20250823-5RP_1612.jpg', // August
      '20250720-5RP_9600.jpg', // July
      '20250607-5RP_9947.jpg', // June
    ];
    
    const thumbnails = page.locator('.landing-gallery-thumb');
    const count = await thumbnails.count();
    
    for (let i = 0; i < Math.min(count, expectedPortraits.length); i++) {
      const thumbnail = thumbnails.nth(i);
      const src = await thumbnail.getAttribute('src');
      
      // Check if the expected portrait image is being used
      expect(src).toContain(expectedPortraits[i]);
      
      // Verify it's actually a portrait by checking natural dimensions
      const dimensions = await thumbnail.evaluate((img: HTMLImageElement) => ({
        width: img.naturalWidth,
        height: img.naturalHeight,
      }));
      
      // Portrait images should be taller than wide
      expect(dimensions.height).toBeGreaterThan(dimensions.width);
    }
  });

  test('gallery thumbnails should not have conflicting CSS classes', async ({ page }) => {
    const thumbnails = page.locator('.landing-gallery-thumb');
    const count = await thumbnails.count();
    
    for (let i = 0; i < count; i++) {
      const thumbnail = thumbnails.nth(i);
      const classList = await thumbnail.evaluate((el) => Array.from(el.classList));
      
      // Should have landing-gallery-thumb
      expect(classList).toContain('landing-gallery-thumb');
      
      // Should NOT have gallery-thumb-img (conflicting class)
      expect(classList).not.toContain('gallery-thumb-img');
    }
  });

  test('hover effects should work on gallery thumbnails', async ({ page }) => {
    const firstThumbnail = page.locator('.landing-gallery-thumb').first();
    
    // Get initial transform
    const initialTransform = await firstThumbnail.evaluate((img) => {
      return window.getComputedStyle(img).transform;
    });
    
    // Hover over the thumbnail
    await firstThumbnail.hover();
    
    // Wait a bit for transition
    await page.waitForTimeout(500);
    
    // Get transform after hover
    const hoverTransform = await firstThumbnail.evaluate((img) => {
      return window.getComputedStyle(img).transform;
    });
    
    // Transform should change on hover (scale effect)
    expect(hoverTransform).not.toBe(initialTransform);
  });

  test('gallery grid should be responsive', async ({ page }) => {
    // Test desktop view
    await page.setViewportSize({ width: 1920, height: 1080 });
    let thumbnails = page.locator('.landing-gallery-thumb');
    let firstHeight = await thumbnails.first().evaluate((img) => {
      return window.getComputedStyle(img).height;
    });
    expect(parseInt(firstHeight)).toBeGreaterThanOrEqual(180);
    
    // Test tablet view
    await page.setViewportSize({ width: 768, height: 1024 });
    await page.waitForTimeout(300);
    firstHeight = await thumbnails.first().evaluate((img) => {
      return window.getComputedStyle(img).height;
    });
    expect(parseInt(firstHeight)).toBeLessThanOrEqual(180);
    
    // Test mobile view
    await page.setViewportSize({ width: 375, height: 667 });
    await page.waitForTimeout(300);
    firstHeight = await thumbnails.first().evaluate((img) => {
      return window.getComputedStyle(img).height;
    });
    expect(parseInt(firstHeight)).toBeLessThanOrEqual(140);
  });
});