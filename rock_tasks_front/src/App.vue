<template>
  <div class="container-fluid">
    <app-side-bar :menuItens="menuItens"></app-side-bar>
    <div id="main_container" >
      <app-top-bar :menuItens="subMenuItens[this.activeMenu]" :pageTitle="activeMenu"></app-top-bar>
      <app-setup v-if="menuItens[2].active" :menuItens="subMenuItens['Setup']"></app-setup>
    </div>    
  </div>
</template>

<script>
  import SideBar from './components/SideBar';
  import TopBar from './components/TopBar';
  import Setup from './components/Setup';
  export default {
    components: {
      AppSideBar : SideBar,
      AppTopBar : TopBar,
      AppSetup : Setup
    },
    computed: {
      activeMenu() {
        return this.menuItens.filter(function (mitem) {
          return mitem.active == true;
        })[0].title;
      }
    },
    data(){
      return {
        menuItens: [
          {id: 1, title:"Tasks", active: false },   
          {id: 2, title:"Contents", active: false },   
          {id: 3, title:"Setup", active: true },   
        ],
        subMenuItens: {
          'Setup': [
            {id: 1, title : "Minha Equipe", active: true},
            {id: 2, title : "Tab Item", active: false},
            {id: 3, title : "Tab Item", active: false},
            {id: 4, title : "Tab Item", active: false}
          ],
          'Tasks' : [
            {id: 5, title : "Tab Item", active: true},
            {id: 6, title : "Tab Item", active: false},
            {id: 7, title : "Tab Item", active: false}
          ],
          'Contents' : [
            {id: 8, title : "Tab Item", active: true},
            {id: 9, title : "Tab Item", active: false},
            {id: 10, title : "Tab Item", active: false}
          ]
        }
      }
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
  padding: 0;
  width: calc(100% - 104px);
}

</style>
