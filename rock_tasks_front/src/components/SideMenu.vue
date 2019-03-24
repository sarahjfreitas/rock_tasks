<template>
  <div id="side_nav">
    <app-side-menu-item v-for="m in menuItens" :item="m" :key="m.id" :class="{ active : m.active }"></app-side-menu-item>
  </div>
</template>

<script>
  import SideMenuItem from './SideMenuItem';
  export default {
    data() {
      return {
        menuItens: [
          {id: 123213, title : "tasks", active: false},
          {id:  123435, title : "contents", active: false},
          {id: 986783, title : "setup", active: true}
        ]
      }
    },
    components: {
      AppSideMenuItem : SideMenuItem
    }
  }
</script>

<style scoped>
  #side_nav {
    position: relative;
    width: 100%;
    margin-top: 25px;
  }  
</style>