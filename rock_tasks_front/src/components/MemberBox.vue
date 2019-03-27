<template>
  <div class="memberBox" @click="fnEdit(member.id)">
    <div class="memberInfoBox">      
      <div class="avatar_container">
        <img src="../assets/default_avatar.png">
      </div>
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
    background: #F2F2F2;
  }
  .memberInfoBox{    
    width: 300px;
    background: rgba(255, 255, 255, 0.4);
    border-radius: 3px;
    box-shadow: 1px 1px 8px rgba(0, 0, 0, 0.04), 1px 1px 1px rgba(0, 0, 0, 0.08);
    padding-bottom: 32px;
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
  .avatar_container{
    width: 64px;
    height: 64px;
    margin: auto;
    margin-top: 24px; 
    border-radius: 100%;
    overflow:hidden;    
    display: inline-block;
  }
  .avatar_container img{
    width: 64px;
    height: 64px;
  }
</style>

<script>
export default {
  props: {'member':Object, 'fnEdit' : Function}
}
</script>
