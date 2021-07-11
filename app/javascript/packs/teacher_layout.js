import Vue from 'vue'
import App from './components/header.vue'
import vuetify from './vty'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({    
    vuetify,
    render: h => h(App),
  }).$mount('#app')

  console.log(app)
})