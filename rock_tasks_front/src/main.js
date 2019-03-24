import Vue from 'vue'
import App from './App.vue'

export const dados = new Vue({
  data(){
    return {
      members: [
        {id: 1, name: 'Aline Costa de Oliveira', email: 'aline.costa@rockcontent.com' },
        {id: 2, name: 'Bruno Pontes', email: 'bruno.pontes@rockcontent.com' },
        {id: 3, name: 'Carla Alvez Martins', email: 'carla@rockcontent.com' },
        {id: 3, name: 'Daniel Henrique Corrêa', email: 'daniel.henrique@rockcontent.com' },
      ],
      currentUser: {id: 1 , email: 'email@email.com', name: 'Carlos', password: '123456', token: ''},
      pageTitle: 'Setup'
    };  
  }
});

new Vue({
  el: '#app',
  render: h => h(App)
})
