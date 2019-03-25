<template>
  <div>
    <app-members v-if="activeMenu == 'Minha Equipe'"></app-members>
  </div>
</template>



<script>
  import Members from './Members';
  export default {    
    components: {
      AppMembers : Members
    },
    props: {
      'menuItens' : Array
    },
    computed: {
      activeMenu() {
        return this.menuItens.filter(function (mitem) {
          return mitem.active == true;
        })[0].title;
      }
    }
  }
</script>