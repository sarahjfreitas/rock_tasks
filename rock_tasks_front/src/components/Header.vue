<template>
  <div id="tab_nav_top">
    <div id="title_bar">
      <span class="title_content">{{title}}</span>
      <span class="user_info_container">
        <span class="user_info_label">Olá, {{currentUser.name}}</span>
        <span class="user_info_button"><span class="icon"></span></span>
      </span>
    </div>
  </div>
</template>

<script>
export default {
  props: ['title','currentUser']
}
</script>


<style scoped>
#tab_nav_top {
  height: 110px;
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
  position: absolute;
  right: 32px;
  top: 32px;
}

#title_bar .user_info_container .user_info_button {
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