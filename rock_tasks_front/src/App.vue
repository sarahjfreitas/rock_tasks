<template>
  <div>
    <app-side-bar></app-side-bar>
    <div id="main_container" class="container">
      <app-top-bar></app-top-bar>
      <app-members></app-members>
    </div>
  </div>
</template>

<script>
  import SideBar from './components/SideBar';
  import TopBar from './components/TopBar';
  import Members from './components/Members';
  export default {
    components: {
      AppSideBar : SideBar,
      AppTopBar : TopBar,
      AppMembers : Members
    }
  }
</script>

<style>
body{
  background: #F2F2F2;
}
#main_container {
  position: absolute;
  top: 0;
  left: 104px;
}
</style>
