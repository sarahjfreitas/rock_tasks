import Vue from 'vue'
import VueResource from 'vue-resource'
import App from './App.vue'

Vue.use(VueResource);


export const dados_globais = {
  activeMenu: 'teste',
  currentUser: {id: 1 , email: 'email@email.com', name: 'Carlos', password: '123456', token: ''},
  pageTitle: 'Setup'    
};

new Vue({
  el: '#app',
  render: h => h(App)
})
