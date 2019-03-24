<template>
  <div id="side_bar">
    <app-logo></app-logo>
    <app-side-menu></app-side-menu>
  </div>
</template>

<script>
  import SideMenu from './SideMenu';
  import Logo from './Logo';
  export default {
    components: {
      AppLogo : Logo,
      AppSideMenu : SideMenu
    }
  }
</script>

<style>
#side_bar {
  position: fixed;
  width: 104px;
  height: 100%;
  left: 0px;
  top: 0px;
  background: #FFFFFF;
  box-shadow: 1px 0px 8px rgba(0, 0, 0, 0.04), 1px 0px 1px rgba(0, 0, 0, 0.08);
}

</style>
