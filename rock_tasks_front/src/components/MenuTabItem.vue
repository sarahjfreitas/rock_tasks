<template>
  <div class="menu_item" :class="{ active: item.active}">
    <span>{{item.name}}</span>
  </div>
</template>

<style scoped>
.menu_item {
  width: 86px;
  padding: 8px 16px 8px 16px;
  border-radius: 2px 2px 0px 0px;
}
.menu_item:hover {
  background: rgba(0, 0, 0, 0.03);
  border-radius: 2px 2px 0px 0px;
}
.menu_item.active {
  background: #F3F5F6;
  border-radius: 2px 2px 0px 0px;
  opacity: unset;
  border-top: #67A949 solid;
}
.menu_item.active span{
  color: #67A949;
  font-style: normal;
  font-weight: 1200;
  opacity: unset;
}
.menu_item span {
  font-family: Roboto;
  font-style: normal;
  font-weight: 800;
  font-size: 12px;
  line-height: 24px;
  text-transform: uppercase;
  color: #263238;
  mix-blend-mode: normal;
  opacity: 0.54;
}
</style>

<script>
export default {
  props: ['item']
}
</script>
