import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'

Vue.use(TurbolinksAdapter)


var about = document.getElementById('aboutSectionOne');

document.addEventListener('turbolinks:load', () => {
const about = new Vue({
  el: "#aboutSectionOne",
  data: {
    seen: false
  }
})
})

about.addEventListener('turbolinks:scroll', () => {
  const about = new Vue({
    el: "#aboutSectionOne",
    data: {
      seen: true
    }
  })
})
