<template>
  <div>
    <div id="tab_nav">
      <app-header :title="pageTitle" :currentUser="currentUser"></app-header>
      <app-menu-tabs></app-menu-tabs>
    </div>
    <div>
      <app-search-bar></app-search-bar>
      <app-actions-bar></app-actions-bar>
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
    data() {
      return {
        pageTitle : 'Setup',
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
}

</style>