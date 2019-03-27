import Vue from 'vue'
import VueResource from 'vue-resource'
import VueNoty from 'vuejs-noty'


import App from './App.vue'

Vue.use(VueResource);
Vue.use(VueNoty)

new Vue({
  el: '#app',
  render: h => h(App)
})
