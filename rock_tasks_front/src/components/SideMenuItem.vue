<template>
  <div class="menu_item">
    <div class="bolinha_container"><div class="bolinha"></div></div>
    <div class="label_container"><div>tasks</div></div>
  </div>
</template>

<style>
#side_nav .menu_item {
  width: 104px;
  height: 96px;
}

#side_nav .menu_item.active::before {
  background: #263238;
  border-radius: 6px 0px 0px 6px;
  width: 2px;
  height: 72px;  
  position: relative;
  top: -8px;
  right: 0;
  float: right;
  content: ''
}
#side_nav .menu_item .menu_item_icon {
  background: #263238;
  mix-blend-mode: normal;
  opacity: 0.38;
  border-radius: 100px;
  width: 24px;
  height: 24px;
  position: relative;
  top: 24px;
  margin: auto;
}
.bolinha_container{
  width: 40px;
  height: 40px;
  margin: auto;
  margin-top: 16px;
  padding: 8px;
}
.bolinha{
  width: 24px;
  height: 24px;
  background: #263238;
  mix-blend-mode: normal;
  opacity: 0.38;
  border-radius: 100px;
}

.label_container{
  width: 100%;
  padding: 8px;
}
.label_container div{
  width: 100%;
  height: 16px;

  font-family: Roboto;
  font-style: normal;
  font-weight: 500;
  font-size: 12px;
  line-height: 16px;
  text-align: center;
  text-transform: uppercase;

  color: #263238;

  mix-blend-mode: normal;
  opacity: 0.38;
}
#side_nav .menu_item .menu_item_label {
  bottom: 0;
}
#side_nav .menu_item .menu_item_label p {
  font-family: Roboto;
  font-style: normal;
  font-weight: 500;
  font-size: 12px;
  line-height: 16px;
  text-align: center;
  text-transform: uppercase;
  color: #263238;
  mix-blend-mode: normal;
  opacity: 0.38;
}
</style>
