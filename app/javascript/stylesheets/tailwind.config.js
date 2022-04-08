const colors = require('tailwindcss/colors')

module.exports = {
  purge: {
    enabled: process.env.NODE_ENV === 'production',
    content: ['./app/views/**/*.*', './app/helpers/**/*.rb', './app/javascript/controllers/**/*.*'],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      gray: colors.warmGray,
      blue: colors.lightBlue,
      red: colors.red,
      yellow: colors.amber,
      green: colors.lime,
      teal: colors.teal,
      cyan: colors.cyan,
      rose: colors.rose
    },
    fontFamily: {
      sans: ['Effra', 'sans-serif'],
      serif: ['Georgia', 'serif']
    },
    extend: {
      fontSize: {
        '8xl': '5.5rem',
        '9xl': '6.2rem',
        '2.5xl': ['1.8rem', '2.45rem'],
        '3.5xl': ['2rem', '2.15rem'],
        '1.5xl': ['1.35rem', '1.9rem']
      },
      colors: {
        body: '#425466', /* default body text */
        blue: {
          primary: '#032C57', /* header titles */
          secondary: '#348EC3', /* hyperlinks, buttons */
          tertiary: '#3FAFD7', /* header titles */
          logodark: '#3d99c9',
          dark: '#0a2540',
          light: '#f6f9fc',
          accent: '#56c8e3'
        },
        gray: {
          100: '#F8F9FA', /* light background */
          200: '#CAD2DE', /* placeholders */
          300: '#8A9BAE', /* disabled */
          400: '#708093', /* secondary body text */
          500: '#536171', /* body text */
          600: '#3C4754', /* card titles */
          light: '#E7E5E4'
        },
        customers: {
          reef: '#1a237d',
          elsinor: '#b7302d',
          greenforce: '#11a283',
          covid: '#c41f79',
          united: '#2BAAE2',
          myhealth: '#f57720'
        }
      },
      boxShadow: {
        'pop-left': '0.3rem 0.3rem 0.6rem #dfdfdf, -0.2rem -0.2rem 0.5rem #ffffff',
        'pop-right': '-0.3rem 0.3rem 0.6rem #dfdfdf, 0.2rem -0.2rem 0.5rem #ffffff'
      },
      transitionProperty: {
        'width': 'width'
      },
      transitionDuration: {
        '10000': '10000ms'
      },
      borderWidth: {
        '3': '3px',
        '6': '6px',
      },
      strokeWidth: {
        '3': '3',
        '4': '4',
      },
      scale: {
        'n1': '-1',
        'n150': '-1.5',
        'n125': '-1.25'
      },
      rotate: {
        '6': '6deg'
      }
    }
  },
  variants: {
    extend: {
      display: ['group-focus'],
      scale: ['hover', 'group-hover'],
      translate: ['hover', 'group-hover']
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography')
  ],
}
