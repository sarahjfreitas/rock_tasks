<template>
  <div>
    <app-menu-tab-item v-for="mi in menuItens" :key="mi.id" :item="mi"></app-menu-tab-item>
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
    props: {
      'menuItens' : Array
    }
  }
</script>