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
      $("#modalMember").modal();
    }
  }
}
</script>
