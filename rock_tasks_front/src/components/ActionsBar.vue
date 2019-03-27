<template>
  <div>
    <button class="btn btn-success" @click="novoMembro()">NOVO MEMBRO</button>
  </div>
</template>

<style scoped>
  div{
    position: absolute;
    right: 50px;
    top: 160px;
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
