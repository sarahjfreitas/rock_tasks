<template>
  <div>
    <app-menu-tab-item v-for="m in menuTabItemsData" :key="m.id" :item="m"></app-menu-tab-item>
  </div>
</template>

<style scoped>
  div {
    margin-left: 32px;     
    height: 40px;    
    display: initial;
  }
</style>

<script>
  import MenuTabItem from './MenuTabItem';
  export default {
    components: {
      AppMenuTabItem : MenuTabItem
    },
    data() {
      return {
        menuTabItemsData: [
          {id: 1, name: 'minha equipe', active: true},
          {id: 2, name: 'tab item', active: false},
          {id: 3, name: 'tab item', active: false},
          {id: 4, name: 'tab item', active: false},
          {id: 5, name: 'tab item', active: false},
        ]
      }
    }
  }
</script>