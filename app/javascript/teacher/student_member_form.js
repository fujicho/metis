import Vue from 'vue/dist/vue.esm'

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#wrapper',
    data: {
      able: true
    }
  })
})