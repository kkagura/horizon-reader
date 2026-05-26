export default defineNuxtConfig({
  compatibilityDate: '2026-05-26',
  devtools: { enabled: true },
  srcDir: 'app',
  serverDir: 'server',
  css: ['~/assets/styles/main.css'],
  runtimeConfig: {
    reportsDir: process.env.REPORTS_DIR || './reports',
  },
  typescript: {
    typeCheck: true,
  },
})
