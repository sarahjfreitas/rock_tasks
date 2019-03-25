<template>
  <div>
    <div id="tab_nav">
      <app-header :title="pageTitle" :currentUser="currentUser"></app-header>
      <app-menu-tabs :menuItens="menuItens"></app-menu-tabs>
    </div>
    <div>
      <app-search-bar></app-search-bar>
      <app-actions-bar v-if="pageTitle == 'Setup' "></app-actions-bar>
    </div>
  </div>
</template>

<script>
  import Header from './Header';
  import MenuTabs from './MenuTabs';
  import SearchBar from './SearchBar';
  import ActionsBar from './ActionsBar';
  export default {
    components: {
      AppHeader : Header,
      AppMenuTabs : MenuTabs,
      AppSearchBar : SearchBar,
      AppActionsBar : ActionsBar
    },
    props: {
      'menuItens' : Array,
      'pageTitle' : String
    },
    data() {
      return {
        currentUser: {
          name: 'Carlos'
        }
      }
    }
  }
</script>

<style scoped>

#tab_nav {
  margin-bottom: 32px;
  width: 100%;
  background: rgba(38, 50, 56, 0.02);
  box-shadow: inset 0px -1px 0px rgba(0, 0, 0, 0.04);
}

</style>