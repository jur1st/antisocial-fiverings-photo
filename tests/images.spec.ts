import { test, expect } from '@playwright/test';

test.describe('Image Validation', () => {
  test('homepage thumbnail images load', async ({ page }) => {
    await page.goto('/');
    
    const images = page.locator('img');
    const count = await images.count();
    
    for (let i = 0; i < count; i++) {
      const img = images.nth(i);
      await expect(img).toBeVisible();
      
      // Verify image has loaded (naturalWidth > 0)
      const naturalWidth = await img.evaluate((el: HTMLImageElement) => el.naturalWidth);
      expect(naturalWidth).toBeGreaterThan(0);
      
      // Verify image has alt text
      const alt = await img.getAttribute('alt');
      expect(alt).toBeTruthy();
    }
  });

  test('no broken image references', async ({ page }) => {
    await page.goto('/');
    
    // Collect all image sources
    const images = await page.locator('img').all();
    const brokenImages: string[] = [];
    
    for (const img of images) {
      const src = await img.getAttribute('src');
      if (!src) continue;
      
      // Check if image loads
      const isLoaded = await img.evaluate((el: HTMLImageElement) => {
        return el.complete && el.naturalWidth > 0;
      });
      
      if (!isLoaded) {
        brokenImages.push(src);
      }
    }
    
    expect(brokenImages).toHaveLength(0);
  });

  test('responsive images have appropriate sizes', async ({ page }) => {
    await page.goto('/');
    
    const images = page.locator('img');
    const count = await images.count();
    
    for (let i = 0; i < count; i++) {
      const img = images.nth(i);
      const srcset = await img.getAttribute('srcset');
      
      // If srcset exists, verify it has multiple sizes
      if (srcset) {
        const sizes = srcset.split(',').length;
        expect(sizes).toBeGreaterThan(1);
      }
      
      // Check image dimensions are reasonable
      const width = await img.evaluate((el: HTMLImageElement) => el.width);
      const height = await img.evaluate((el: HTMLImageElement) => el.height);
      
      expect(width).toBeGreaterThan(0);
      expect(height).toBeGreaterThan(0);
      expect(width).toBeLessThanOrEqual(2000); // Max reasonable width
      expect(height).toBeLessThanOrEqual(2000); // Max reasonable height
    }
  });

  test('image file sizes are optimized', async ({ page, request }) => {
    await page.goto('/');
    
    const images = await page.locator('img').all();
    const oversizedImages: { src: string; size: number }[] = [];
    
    for (const img of images) {
      const src = await img.getAttribute('src');
      if (!src || src.startsWith('data:')) continue;
      
      // Get image file size
      const response = await request.get(src);
      const buffer = await response.body();
      const sizeInMB = buffer.length / (1024 * 1024);
      
      // Flag images over 2MB
      if (sizeInMB > 2) {
        oversizedImages.push({ src, size: sizeInMB });
      }
    }
    
    // Report oversized images
    if (oversizedImages.length > 0) {
      console.log('Oversized images found:', oversizedImages);
    }
    
    expect(oversizedImages).toHaveLength(0);
  });
});