<template>
  <div>
    <div id="tab_nav">
      <app-header></app-header>
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
    }
  }
</script>

<style>

#tab_nav {
  height: 200px;
}

#tab_nav_top {
  height: 128px;
}
#title_bar {
  padding: 32px;
}
#title_bar .title_content {
  font-family: Roboto;
  font-style: normal;
  font-weight: 500;
  font-size: 20px;
  line-height: 24px;

  color: #607D8B;

}
#title_bar .user_info_container {
  position: fixed;
  right: 32px;
  top: 32px;
}

#title_bar .user_info_container .user_info_button {
  position: absolute;
  width: 24px;
  height: 24px;
  left: 1384px;
  top: 32px;
}

#title_bar .user_info_container .user_info_button .icon {
  width: 8px;
  height: 4px;
  margin: auto;

  background: #455A64;
  mix-blend-mode: normal;
  opacity: 0.38;
}

#title_bar .user_info_container .user_info_label {
  font-family: Roboto;
  font-style: normal;
  font-weight: 500;
  font-size: 14px;
  line-height: 24px;
  text-align: right;

  color: #455A64;

  mix-blend-mode: normal;
  opacity: 0.54;
}

</style>