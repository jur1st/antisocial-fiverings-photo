/**
 * PostCSS Configuration
 * 
 * Optimizes CSS for production while preserving theme switching capability
 * Development: Source maps, no minification
 * Production: Minified, optimized, no source maps
 */

module.exports = (ctx) => ({
  map: ctx.env === 'development' ? { inline: false } : false,
  
  plugins: {
    // Import and inline CSS files
    'postcss-import': {
      path: ['static/css/src']
    },
    
    // Add vendor prefixes
    'autoprefixer': {
      overrideBrowserslist: [
        '> 1%',
        'last 2 versions',
        'not dead',
        'not ie 11'
      ]
    },
    
    // Minification for production only
    ...(ctx.env === 'production' && {
      'cssnano': {
        preset: ['default', {
          discardComments: {
            removeAll: true
          },
          normalizeWhitespace: true,
          colormin: true,
          reduceIdents: false, // Preserve theme selectors
          discardDuplicates: true,
          discardEmpty: true,
          minifyFontValues: true,
          minifyGradients: true,
          minifySelectors: {
            // Don't minify theme selectors
            exclude: [/data-theme/]
          },
          // Preserve CSS custom properties for runtime theming
          cssDeclarationSorter: false
        }]
      }
    }),
    
    // Report compilation results
    'postcss-reporter': {
      clearReportedMessages: true,
      noIcon: false,
      noPlugin: false
    }
  }
});