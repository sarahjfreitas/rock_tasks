<template>
  <div class="row">
    <app-member-box v-for="m in members" :key="m.id" :member="m"></app-member-box>
  </div>
</template>

<script>
  import MemberBox from './MemberBox';
  export default {
    components: {
      AppMemberBox : MemberBox
    },
    data(){
      return {
        members: [
          {id: 1, name: 'Aline Costa de Oliveira', email: 'aline.costa@rockcontent.com' },
          {id: 2, name: 'Bruno Pontes', email: 'bruno.pontes@rockcontent.com' },
          {id: 3, name: 'Carla Alvez Martins', email: 'carla@rockcontent.com' },
          {id: 4, name: 'Daniel Henrique Corrêa', email: 'daniel.henrique@rockcontent.com' }
        ]
      };  
    }
  }
</script>

<style scoped>
  div {
    margin: 32px;
  }
</style>
