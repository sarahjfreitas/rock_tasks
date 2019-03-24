<template>
  <div id="side_nav">
    <app-side-menu-item></app-side-menu-item>
    <app-side-menu-item></app-side-menu-item>
    <app-side-menu-item></app-side-menu-item>
  </div>
</template>

<script>
  import SideMenuItem from './SideMenuItem';
  export default {
    components: {
      AppSideMenuItem : SideMenuItem
    }
  }
</script>

<style>
  #side_nav {
    position: relative;
    width: 100%;
    margin-top: 25px;
  }  
</style>