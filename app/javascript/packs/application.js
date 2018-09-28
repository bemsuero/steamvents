/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?",
//       seen: true
//
//     }
//   })
// })
//
// If the using turbolinks, install 'vue-turbolinks':

// yarn add 'vue-turbolinks'

// Then uncomment the code block below:

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'

Vue.use(TurbolinksAdapter)

about = document.getElementById('aboutSectionOne');

document.addEventListener('turbolinks:load', () => {
  const viewtest = new Vue({
    el: '#hello',
    data: {
      message: "Can you say hello?",
      seen: true
    }
  })
  const guestBox = new Vue({
  el: '#guestBox',
  data: {
    show: false
  }
})
const userBox = new Vue({
  el: '#userBox',
  data: {
    show: false
  }
})
const about = new Vue({
  el: "#aboutSectionOne",
  data: {
    seen: false
})

about.addEventListener('turbolinks:scroll'), () => {
  const about = new Vue({
    el: "#aboutSectionOne",
    data: {
      seen: true
    }
  })
}
