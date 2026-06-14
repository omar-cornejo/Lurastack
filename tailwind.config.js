/** @type {import('tailwindcss').Config} */
import iconify from 'tailwindcss-iconify'

export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx,vue,svelte}",
  ],
  safelist: [
    'icon-[weui--arrow-filled]',
    'icon-[weui--more-filled]',
    'rotate-180',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', 'ui-sans-serif', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'sans-serif'],
      },
    },
  },
  plugins: [iconify()],
}
