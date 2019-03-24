<template>
  <div>
    <app-side-bar></app-side-bar>
    <div id="main_container">
      <app-top-bar></app-top-bar>
    </div>
  </div>
</template>

<script>
  import SideBar from './components/SideBar';
  import TopBar from './components/TopBar';
  export default {
    components: {
      AppSideBar : SideBar,
      AppTopBar : TopBar
    }
  }
</script>

<style>
#main_container {
  background: #F2F2F2;
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  left: 104px;
}
</style>
