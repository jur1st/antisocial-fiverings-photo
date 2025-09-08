import { test, expect } from '@playwright/test';

test.describe('CSS Optimization Visual Comparison', () => {
  const pages = [
    { name: 'homepage', path: '/' },
    { name: 'gallery', path: '/galleries/labor-day-rally-2025/' },
    { name: 'photo', path: '/photos/labor-day-rally-2025-001/' }
  ];

  for (const pageInfo of pages) {
    test(`Compare ${pageInfo.name}`, async ({ page }) => {
      // Set viewport for consistency
      await page.setViewportSize({ width: 1920, height: 1080 });
      
      // Screenshot original CSS (port 1313)
      await page.goto(`http://localhost:1313${pageInfo.path}`);
      await page.waitForLoadState('networkidle');
      const original = await page.screenshot({ 
        fullPage: true,
        path: `tests/screenshots/${pageInfo.name}-original.png`
      });
      
      // Screenshot optimized CSS (port 3000)
      await page.goto(`http://localhost:3000${pageInfo.path}`);
      await page.waitForLoadState('networkidle');
      const optimized = await page.screenshot({ 
        fullPage: true,
        path: `tests/screenshots/${pageInfo.name}-optimized.png`
      });
      
      // Screenshot production (live site)
      await page.goto(`https://antisocial.fiverings.photo${pageInfo.path}`);
      await page.waitForLoadState('networkidle');
      const production = await page.screenshot({ 
        fullPage: true,
        path: `tests/screenshots/${pageInfo.name}-production.png`
      });
      
      console.log(`✅ Screenshots saved for ${pageInfo.name}`);
    });
  }
});