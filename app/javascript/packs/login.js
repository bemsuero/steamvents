

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'

Vue.use(TurbolinksAdapter)




document.addEventListener('turbolinks:load', () => {
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
})
