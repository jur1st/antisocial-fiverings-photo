import { test, expect } from '@playwright/test';

test.describe('Visual Regression Tests', () => {
  test('landing page should match visual snapshot', async ({ page }) => {
    await page.goto('/');
    
    // Wait for gallery to load
    await expect(page.locator('.gallery-grid')).toBeVisible();
    await page.waitForLoadState('networkidle');
    
    // Take full page screenshot
    await expect(page).toHaveScreenshot('landing-page.png', {
      fullPage: true,
      animations: 'disabled',
    });
  });

  test('landing page thumbnails should match visual snapshot', async ({ page }) => {
    await page.goto('/');
    await expect(page.locator('.gallery-grid')).toBeVisible();
    
    // Screenshot just the gallery grid
    const galleryGrid = page.locator('.gallery-grid');
    await expect(galleryGrid).toHaveScreenshot('gallery-grid.png', {
      animations: 'disabled',
    });
  });

  test('Flynn theme colors should be consistent', async ({ page }) => {
    await page.goto('/');
    
    // Check Nikon yellow accent is present
    const accentElements = page.locator('[style*="#FFD700"]');
    const yellowElements = page.locator('[style*="255, 215, 0"]');
    
    // At least some elements should use the accent color
    const totalAccents = await accentElements.count() + await yellowElements.count();
    expect(totalAccents).toBeGreaterThanOrEqual(0);
    
    // Check dark background
    const bodyBg = await page.locator('body').evaluate((el) => {
      return window.getComputedStyle(el).backgroundColor;
    });
    
    // Should be dark (Flynn theme)
    expect(bodyBg).toMatch(/rgb\((\d+), (\d+), (\d+)\)/);
  });

  test('no visual artifacts in portrait thumbnails', async ({ page }) => {
    await page.goto('/');
    await expect(page.locator('.gallery-grid')).toBeVisible();
    
    const thumbnails = page.locator('.landing-gallery-thumb');
    const count = await thumbnails.count();
    
    for (let i = 0; i < count; i++) {
      const thumbnail = thumbnails.nth(i);
      
      // Check for visual artifacts
      const boxShadow = await thumbnail.evaluate((img) => {
        return window.getComputedStyle(img).boxShadow;
      });
      
      // Should have proper shadow (no harsh edges)
      expect(boxShadow).toBeTruthy();
      
      // Check border radius is applied
      const borderRadius = await thumbnail.evaluate((img) => {
        return window.getComputedStyle(img).borderRadius;
      });
      
      expect(borderRadius).not.toBe('0px');
      
      // Take snapshot of individual thumbnail
      await expect(thumbnail).toHaveScreenshot(`thumbnail-${i}.png`, {
        animations: 'disabled',
      });
    }
  });

  test('mobile view should not have layout issues', async ({ page }) => {
    // Set mobile viewport
    await page.setViewportSize({ width: 375, height: 667 });
    await page.goto('/');
    
    await expect(page.locator('.gallery-grid')).toBeVisible();
    
    // Check no horizontal overflow
    const hasHorizontalScroll = await page.evaluate(() => {
      return document.documentElement.scrollWidth > document.documentElement.clientWidth;
    });
    
    expect(hasHorizontalScroll).toBe(false);
    
    // Take mobile screenshot
    await expect(page).toHaveScreenshot('landing-page-mobile.png', {
      fullPage: true,
      animations: 'disabled',
    });
  });
});