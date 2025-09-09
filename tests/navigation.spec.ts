import { test, expect } from '@playwright/test';

test.describe('Navigation Tests', () => {
  test('gallery links should navigate correctly', async ({ page }) => {
    await page.goto('/');
    
    const galleryLinks = page.locator('.gallery-item');
    const count = await galleryLinks.count();
    
    expect(count).toBeGreaterThan(0);
    
    // Test first gallery link
    const firstLink = galleryLinks.first();
    const href = await firstLink.getAttribute('href');
    
    expect(href).toBeTruthy();
    
    // Click and verify navigation
    await firstLink.click();
    await page.waitForLoadState('networkidle');
    
    // Should navigate to gallery page
    expect(page.url()).toContain(href);
  });

  test('breadcrumbs should work on gallery pages', async ({ page }) => {
    // Navigate to a gallery first
    await page.goto('/galleries/labor-day-rally-2025/');
    
    // Check if breadcrumbs exist
    const breadcrumbs = page.locator('.breadcrumb, nav[aria-label="breadcrumb"]');
    
    if (await breadcrumbs.count() > 0) {
      // Click home breadcrumb
      const homeLink = breadcrumbs.locator('a').filter({ hasText: /home|antisocial/i }).first();
      
      if (await homeLink.count() > 0) {
        await homeLink.click();
        await page.waitForLoadState('networkidle');
        
        // Should be back at homepage
        expect(page.url()).toBe('http://localhost:1313/');
      }
    }
  });

  test('header navigation should be consistent', async ({ page }) => {
    await page.goto('/');
    
    const header = page.locator('header, .header, .site-header').first();
    await expect(header).toBeVisible();
    
    // Check for site title/logo
    const siteTitle = header.locator('h1, .site-title, .logo').first();
    
    if (await siteTitle.count() > 0) {
      await expect(siteTitle).toBeVisible();
    }
    
    // Navigate to gallery and check header is still there
    await page.goto('/galleries/labor-day-rally-2025/');
    await expect(header).toBeVisible();
  });
});