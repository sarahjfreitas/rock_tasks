<template>
  <div class="memberBox col-md-3">
    <div class="memberInfoBox">      
      <span class="nameLabel">{{member.name}}</span>
      <span class="emailLabel">{{member.email}}</span>
    </div>
    <div class="memberActionsBox"></div>
  </div>
</template>

<style scoped>
  .memberBox{
    margin: 0;
    padding: 12px;
    text-align: center;
  }
  .memberInfoBox{    
    background: #fff;
    height: 150px;
  }
  .nameLabel{
    font-family: Roboto;
    font-style: normal;
    font-weight: 500;
    font-size: 16px;
    line-height: 24px;
    text-align: center;
    color: rgba(0, 0, 0, 0.38);
    display: block;
  }
  .emailLabel{
    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 12px;
    line-height: 16px;
    text-align: center;
    color: #607D8B;
    mix-blend-mode: normal;
    opacity: 0.54;
    display: block;
  }
</style>

<script>
export default {
  props: ['member']
}
</script>
