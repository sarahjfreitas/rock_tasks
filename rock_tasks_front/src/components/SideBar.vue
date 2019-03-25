<template>
  <div id="side_bar">
    <app-logo></app-logo>
    <div id="side_nav">
      <app-side-menu-item v-for="m in menuItens" :item="m" :key="m.id" :class="{ active : m.active }" :menuItemFn="menuItemClicked"></app-side-menu-item>
    </div>
  </div>
</template>

<script>
  import SideMenuItem from './SideMenuItem';
  import Logo from './Logo';
  export default {
    components: {
      AppLogo : Logo,
      AppSideMenuItem : SideMenuItem
    },
    props: {
      'menuItens' : Array
    },
    methods: {
      menuItemClicked(menu_id){
        var vm = this;
        $.each(vm.menuItens, function(i,v){
          if(v.id == menu_id)
            v.active = true;
          else
            v.active = false;
        });
      }
    }
  }
</script>

<style scoped>
#side_nav {
  position: relative;
  width: 100%;
  margin-top: 25px;
} 
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
