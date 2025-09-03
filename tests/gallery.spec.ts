import { test, expect } from '@playwright/test';

test.describe('Gallery Operations', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('all gallery thumbnails should load', async ({ page }) => {
    // Wait for gallery grid to be visible
    await expect(page.locator('.gallery-grid')).toBeVisible();
    
    // Check all gallery thumbnails load
    const thumbnails = page.locator('.gallery-thumb-img');
    const count = await thumbnails.count();
    
    for (let i = 0; i < count; i++) {
      const thumbnail = thumbnails.nth(i);
      await expect(thumbnail).toBeVisible();
      
      // Check image actually loaded (not broken)
      const naturalWidth = await thumbnail.evaluate((img: HTMLImageElement) => img.naturalWidth);
      expect(naturalWidth).toBeGreaterThan(0);
    }
  });

  test('gallery links should navigate correctly', async ({ page }) => {
    const galleryLinks = page.locator('.gallery-item');
    const count = await galleryLinks.count();
    
    for (let i = 0; i < count; i++) {
      await page.goto('/');
      const link = galleryLinks.nth(i);
      const href = await link.getAttribute('href');
      
      await link.click();
      await expect(page).toHaveURL(href!);
      
      // Verify gallery page loads
      await expect(page.locator('.gallery-header, h1')).toBeVisible();
    }
  });

  test('gallery photo navigation works', async ({ page }) => {
    // Navigate to first gallery
    await page.locator('.gallery-item').first().click();
    
    // Check if photos exist
    const photos = page.locator('.photo-item, .gallery-photo, img[src*="/images/"]');
    const photoCount = await photos.count();
    
    if (photoCount > 0) {
      // Click first photo
      await photos.first().click();
      
      // Check navigation links exist
      const hasNavigation = await page.locator('.photo-nav, .navigation, a[href*="photo"]').count() > 0;
      
      if (hasNavigation) {
        // Test next/previous navigation
        const nextLink = page.locator('a:has-text("Next"), a:has-text("→")').first();
        if (await nextLink.isVisible()) {
          await nextLink.click();
          await expect(page).toHaveURL(/photo/);
        }
      }
    }
  });

  test('no broken image links in galleries', async ({ page }) => {
    const galleryLinks = page.locator('.gallery-item');
    const galleryCount = await galleryLinks.count();
    
    for (let i = 0; i < galleryCount; i++) {
      await page.goto('/');
      await galleryLinks.nth(i).click();
      
      // Check all images in gallery
      const images = page.locator('img');
      const imageCount = await images.count();
      
      for (let j = 0; j < imageCount; j++) {
        const img = images.nth(j);
        const src = await img.getAttribute('src');
        
        if (src && !src.startsWith('data:')) {
          // Check image loads successfully
          const response = await page.request.get(src);
          expect(response.status()).toBeLessThan(400);
        }
      }
    }
  });

  test('gallery photo count matches actual photos', async ({ page }) => {
    const galleryLinks = page.locator('.gallery-item');
    const count = await galleryLinks.count();
    
    for (let i = 0; i < count; i++) {
      await page.goto('/');
      const galleryItem = galleryLinks.nth(i);
      
      // Get photo count from gallery meta
      const metaText = await galleryItem.locator('.gallery-meta').textContent();
      const match = metaText?.match(/(\d+)\s*Photos?/i);
      
      if (match) {
        const expectedCount = parseInt(match[1]);
        
        // Navigate to gallery
        await galleryItem.click();
        
        // Count actual photos
        const actualPhotos = await page.locator('.photo-item, .gallery-photo, article.photo').count();
        
        // They should match (or be close if some UI elements are counted)
        expect(Math.abs(actualPhotos - expectedCount)).toBeLessThanOrEqual(1);
      }
    }
  });
});