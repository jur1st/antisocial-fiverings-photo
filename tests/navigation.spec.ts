import { test, expect } from '@playwright/test';

test.describe('Site Navigation', () => {
  test('homepage loads successfully', async ({ page }) => {
    await page.goto('/');
    await expect(page).toHaveTitle(/Five Rings/);
    await expect(page.locator('h1, .site-title')).toContainText(/Five Rings/);
  });

  test('about page is accessible', async ({ page }) => {
    await page.goto('/');
    await page.getByRole('link', { name: 'About' }).click();
    await expect(page).toHaveURL('/about/');
    await expect(page.locator('h1, .page-title')).toBeVisible();
  });

  test('all navigation links work', async ({ page }) => {
    await page.goto('/');
    
    const links = page.locator('a[href^="/"]');
    const count = await links.count();
    const checkedUrls = new Set<string>();
    
    for (let i = 0; i < count; i++) {
      const link = links.nth(i);
      const href = await link.getAttribute('href');
      
      // Skip if already checked or if it's an anchor link
      if (!href || href === '/' || href.includes('#') || checkedUrls.has(href)) {
        continue;
      }
      
      checkedUrls.add(href);
      
      // Navigate to the link
      const response = await page.request.get(href);
      expect(response.status()).toBeLessThan(400);
    }
  });

  test('404 page handles missing content', async ({ page }) => {
    const response = await page.goto('/this-page-does-not-exist/');
    expect(response?.status()).toBe(404);
    
    // Check 404 page renders
    await expect(page.locator('body')).toContainText(/404|not found/i);
  });

  test('footer links are functional', async ({ page }) => {
    await page.goto('/');
    
    const footer = page.locator('footer');
    await expect(footer).toBeVisible();
    
    const footerLinks = footer.locator('a');
    const count = await footerLinks.count();
    
    for (let i = 0; i < count; i++) {
      const link = footerLinks.nth(i);
      const href = await link.getAttribute('href');
      
      if (href && !href.startsWith('mailto:') && !href.startsWith('#')) {
        // Check link is valid
        const response = await page.request.head(href);
        expect(response.status()).toBeLessThan(400);
      }
    }
  });
});