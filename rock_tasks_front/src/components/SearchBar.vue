<template>
  <div class="row">
    <div class="col-md-4">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text"><span class="fa fa-search"></span></span>
        </div>
        <input type="text" name="search" placeholder="Digite uma palavra chave e tecle enter para buscar" class="form-control">
      </div>
    </div>
  </div>
</template>

<style scoped>  
input{
  font-family: Roboto;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 24px;
  color: #90A4AE;
  border: 0;
  background-color: inherit;
}
.input-group {    
  border-bottom: 1px solid #ced4da;
}
.input-group-prepend{
  border: 0;
}
.input-group-text{
  border: 0;
  background: none;
}
.fa{    
  opacity: 0.5;
}
.row{
  margin: 0;
}
</style>

<script >
export default {
  
}
</script>
