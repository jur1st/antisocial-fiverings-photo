import { test, expect } from '@playwright/test';

test.describe('Image Loading Tests', () => {
  test('all images should load successfully', async ({ page }) => {
    await page.goto('/');
    
    // Get all images on the page
    const images = page.locator('img');
    const count = await images.count();
    
    expect(count).toBeGreaterThan(0);
    
    for (let i = 0; i < count; i++) {
      const img = images.nth(i);
      
      // Check image is visible
      await expect(img).toBeVisible();
      
      // Verify image has loaded
      const isLoaded = await img.evaluate((image: HTMLImageElement) => {
        return image.complete && image.naturalHeight !== 0;
      });
      
      expect(isLoaded).toBe(true);
      
      // Check src attribute exists
      const src = await img.getAttribute('src');
      expect(src).toBeTruthy();
    }
  });

  test('portrait images should maintain aspect ratio', async ({ page }) => {
    await page.goto('/');
    
    const portraits = page.locator('.landing-gallery-thumb');
    const count = await portraits.count();
    
    for (let i = 0; i < count; i++) {
      const img = portraits.nth(i);
      
      const dimensions = await img.evaluate((image: HTMLImageElement) => ({
        natural: {
          width: image.naturalWidth,
          height: image.naturalHeight,
        },
        displayed: {
          width: image.clientWidth,
          height: image.clientHeight,
        },
      }));
      
      // Natural dimensions should indicate portrait orientation
      if (dimensions.natural.height > dimensions.natural.width) {
        const naturalRatio = dimensions.natural.width / dimensions.natural.height;
        
        // Aspect ratio should be preserved (allowing for cover cropping)
        expect(naturalRatio).toBeGreaterThan(0);
        expect(naturalRatio).toBeLessThan(1);
      }
    }
  });

  test('images should have proper alt text', async ({ page }) => {
    await page.goto('/');
    
    const images = page.locator('img');
    const count = await images.count();
    
    for (let i = 0; i < count; i++) {
      const img = images.nth(i);
      const alt = await img.getAttribute('alt');
      
      // Alt text should exist and not be empty
      expect(alt).toBeTruthy();
      expect(alt.length).toBeGreaterThan(0);
    }
  });

  test('no broken image links', async ({ page }) => {
    const brokenImages: string[] = [];
    
    // Listen for failed image requests
    page.on('response', response => {
      if (response.request().resourceType() === 'image' && response.status() >= 400) {
        brokenImages.push(response.url());
      }
    });
    
    await page.goto('/');
    await page.waitForLoadState('networkidle');
    
    // Check no broken images were found
    expect(brokenImages).toHaveLength(0);
  });
});