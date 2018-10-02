import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'

Vue.use(TurbolinksAdapter)


document.on('turbolinks:load', () => {
const aboutSection = new Vue({
  el: "#aboutSectionOne",
  data: {
    show: false
  }
})
})
