<template>
  <div class="row">
    <div class="filter_box">
      <div class="btn-group" role="group" aria-label="Basic example">
        <button type="button" class="btn btn_outline_custom">Freelas</button>
        <button type="button" class="btn btn_secondary_custom">Usuários</button>
      </div>
    </div>
    <button class="btn btn-success" @click="novoMembro()">NOVO MEMBRO</button>
  </div>
</template>

<style scoped>
  .row {
    position: absolute;
    right: 50px;
    top: 160px;
  }
  .btn_outline_custom{
    background: #F9F9F9;
    box-shadow: 2px 0px 0px rgba(0, 0, 0, 0.04), 1px 0px 0px rgba(0, 0, 0, 0.04), inset 0px 1px 0px #FFFFFF;
    border: 1px solid rgba(176, 190, 197, 0.38);
    border-radius: 2px 0px 0px 2px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 12px;
    line-height: 16px;
    text-transform: uppercase;
    color: #B0BEC5;
  }
  .btn_secondary_custom{
    background: rgba(207, 216, 220, 0.12);
    border: 1px solid rgba(176, 190, 197, 0.38);
    border-radius: 2px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 12px;
    line-height: 16px;
    text-transform: uppercase;
    color: #78909C;
  }
  .filter_box{
    margin-right: 24px;
    margin-top: 4.75px;
  }
  .btn-success {
    background: #87C06D;
    box-shadow: 0px 1px 0px rgba(73, 32, 45, 0.12), inset 0px -1px 0px rgba(0, 0, 0, 0.12);
    border-radius: 2px;
    border: 0;
    padding: 12px 21.5px 12px 21.5px;    
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 12px;
    line-height: 16px;
    text-align: center;
    text-transform: uppercase;
    color: #FFFFFF;
  }
</style>

<script>
export default {
  methods: {
    novoMembro(){
      $('#modalMember').attr('modo','new');
      $('#modalMember .modal-title').text('Novo Membro');
      $('#modalMember .btn').text('Criar Membro da Equipe');
      $("#modalMember").modal();
    }
  }
}
</script>
