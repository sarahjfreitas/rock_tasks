<template>
  <div class="row">
    <app-member-box v-for="m in members" :key="m.id" :member="m"></app-member-box>
    <div class="modal" tabindex="-1" role="dialog" id="modalMember">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Novo Membro</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="">
              <div class="col-md-12">
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="Nome" v-model="newMember.name">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="E-mail" v-model="newMember.email">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="Função de trabalho" v-model="newMember.job">
                </div>
                <div class="submitContainer">
                  <button type="button" class="btn btn-primary" @click="createMember()">Criar Membro da Equipe</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import MemberBox from './MemberBox';
  const instance = axios.create({
    baseURL: 'https://some-domain.com/api/',
    timeout: 1000,
    headers: {'X-Custom-Header': 'foobar'}
  });
  export default {
    components: {
      AppMemberBox : MemberBox
    },
    data(){
      return {
        members: [
          {id: 1, name: 'Aline Costa de Oliveira', email: 'aline.costa@rockcontent.com' },
          {id: 2, name: 'Bruno Pontes', email: 'bruno.pontes@rockcontent.com' },
          {id: 3, name: 'Carla Alvez Martins', email: 'carla@rockcontent.com' },
          {id: 4, name: 'Daniel Henrique Corrêa', email: 'daniel.henrique@rockcontent.com' }
        ],
        newMember: {
          name: '',
          email: '',
          job: ''
        }
      };  
    },
    methods: {
      createMember() {
        this.members.push({id: 0, name: this.newMember.name, email: this.newMember.email});
        this.newMember.name = '';
        this.newMember.email = '';
        this.newMember.job = '';
        $('#modalMember').modal('hide');
      }
    }
  }
  
</script>

<style scoped>
.row {
  margin: 32px;
}
.modal-dialog{
  height: 100%;
  width: 1500px;
  top: 0;
  right: 0;
  position: absolute;
  margin: 0;
}
.modal-content{
  height: 100%;
  border: 0;
  border-radius: 0;
}
.modal-title{
  font-family: Roboto;
  font-style: normal;
  font-weight: 500;
  font-size: 20px;
  line-height: 24px;
  color: #000000;
  mix-blend-mode: normal;
  opacity: 0.38;
}
input{
  font-family: Roboto;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 24px;
  color: #90A4AE;
  border: 0;
  background-color: inherit;
  border-bottom: 1px solid #ced4da;
  border-radius: 0;
}
.close{   
  position: relative;
  right: 492px;
  background: white;
  opacity: 1;
  color: #90A4AE;
  font-size: 12px;
  padding: 8px;
}
.close:hover{  
  opacity: 1 !important;
}
.submitContainer{
  text-align: right;
  margin-top: 30px;
}
</style>
