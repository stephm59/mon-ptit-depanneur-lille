import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";
import path from "path";
import { componentTagger } from "lovable-tagger";
import { VitePWA } from 'vite-plugin-pwa';

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => ({
  server: {
    host: "::",
    port: 8080,
  },
  plugins: [
    react(),
    mode === 'development' && componentTagger(),
    VitePWA({
      registerType: 'autoUpdate',
      includeAssets: ['favicon.ico', 'robots.txt'],
      manifest: {
        name: "Mon p'tit Dépanneur",
        short_name: "MPD",
        description: "Chauffagiste, Plombier, Serrurier à Lille",
        theme_color: '#0d47a1',
        icons: [
          {
            src: '/src/assets/logo-mon-ptit-depanneur.png',
            sizes: '192x192',
            type: 'image/png'
          }
        ]
      },
      workbox: {
        globPatterns: ['**/*.{js,css,html,ico,svg}'],
        globIgnores: ['**/lovable-uploads/**'],
        maximumFileSizeToCacheInBytes: 3 * 1024 * 1024, // 3 MiB
        runtimeCaching: [
          {
            urlPattern: /^https:\/\/fonts\.googleapis\.com\/.*/i,
            handler: 'CacheFirst',
            options: {
              cacheName: 'google-fonts-cache',
              expiration: {
                maxEntries: 10,
                maxAgeSeconds: 60 * 60 * 24 * 365 // 1 year
              },
              cacheableResponse: {
                statuses: [0, 200]
              }
            }
          },
          {
            urlPattern: /\/lovable-uploads\/.*/i,
            handler: 'CacheFirst',
            options: {
              cacheName: 'local-images-cache',
              expiration: {
                maxEntries: 100,
                maxAgeSeconds: 60 * 60 * 24 * 30 // 30 days
              },
              cacheableResponse: {
                statuses: [0, 200]
              }
            }
          },
          {
            urlPattern: /^https:\/\/pub-ee5d8554679a4a23a82caac56686992a\.r2\.dev\/.*(\.jpg|\.png|\.webp)$/i,
            handler: 'CacheFirst',
            options: {
              cacheName: 'r2-images-cache',
              expiration: {
                maxEntries: 50,
                maxAgeSeconds: 60 * 60 * 24 * 30 // 30 days
              },
              cacheableResponse: {
                statuses: [0, 200]
              }
            }
          },
          {
            urlPattern: /^https:\/\/pub-ee5d8554679a4a23a82caac56686992a\.r2\.dev\/.*\.mp4$/i,
            handler: 'NetworkFirst',
            options: {
              cacheName: 'r2-videos-cache',
              expiration: {
                maxEntries: 10,
                maxAgeSeconds: 60 * 60 * 24 * 7 // 7 days
              },
              cacheableResponse: {
                statuses: [0, 200]
              }
            }
          }
        ]
      }
    })
  ].filter(Boolean),
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
  build: {
    target: 'es2015',
    minify: 'terser',
    terserOptions: {
      compress: {
        drop_console: true,
        drop_debugger: true,
        pure_funcs: ['console.log', 'console.info']
      }
    },
    rollupOptions: {
      output: {
        manualChunks: (id) => {
          // React core
          if (id.includes('node_modules/react') || id.includes('node_modules/react-dom')) {
            return 'vendor-react';
          }
          // React Router
          if (id.includes('node_modules/react-router')) {
            return 'vendor-router';
          }
          // Radix UI components
          if (id.includes('node_modules/@radix-ui')) {
            return 'vendor-ui';
          }
          // Forms
          if (id.includes('node_modules/react-hook-form') || 
              id.includes('node_modules/@hookform') || 
              id.includes('node_modules/zod')) {
            return 'vendor-forms';
          }
          // Icons
          if (id.includes('node_modules/lucide-react')) {
            return 'vendor-icons';
          }
          // Supabase
          if (id.includes('node_modules/@supabase')) {
            return 'vendor-supabase';
          }
          // Email JS
          if (id.includes('node_modules/@emailjs')) {
            return 'vendor-emailjs';
          }
          // React Markdown and rehype/remark
          if (id.includes('node_modules/react-markdown') || 
              id.includes('node_modules/rehype') || 
              id.includes('node_modules/remark')) {
            return 'vendor-markdown';
          }
          // Split blog posts into separate chunk
          if (id.includes('/src/pages/BlogPost')) {
            return 'page-blog-post';
          }
          // Split service city pages
          if (id.includes('/src/pages/ServiceCity')) {
            return 'page-service-city';
          }
        }
      }
    },
    chunkSizeWarningLimit: 800,
    cssCodeSplit: true,
    sourcemap: false
  }
}));
