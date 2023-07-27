module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],

  plugins: [
    require('@tailwindcss/typography'),
    require('daisyui'),
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#D66200",
          "secondary": "#33B7B3",
          "accent": "#FFF100",
          "neutral": "#A7D2CB",
          "base-100": "#fdfcfd",
          "info": "#c7d2fe",
          "success": "#bbf7d0",
          "warning": "#fde68a",
          "error": "#fda4af",
        },
      },
    ],
  },
}
