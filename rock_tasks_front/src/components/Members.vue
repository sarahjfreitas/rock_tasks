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
                  <div class="invalid-feedback" v-if="!name_valid">Preencha o nome</div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" placeholder="E-mail" v-model="newMember.email">
                  <div class="invalid-feedback" v-if="!email_valid">E-mail inválido</div>
                </div>
                <div class="form-group">
                  <select class="form-control" placeholder="Função de trabalho" v-model="newMember.role_id">
                    <option v-for="j in roles" :key="j.id" :value="j.id">{{j.name}}</option>
                  </select>
                  <div class="invalid-feedback" v-if="!role_valid">Selecione a função</div>
                </div>
                <div class="submitContainer">
                  <button type="button" class="btn btn-primary" @click="createMember()" >Criar Membro da Equipe</button>
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
  export default {
    components: {
      AppMemberBox : MemberBox
    },
    data(){
      return {
        members: [],
        newMember: {name: '',email: '',role_id: ''  },
        token: '',
        roles: [],
        path: 'http://localhost:3000/'
      };  
    },
    computed: {
      headers(){
        return {
          headers: {'Authorization' : this.token }
        };
      },
      name_invalid(){
        return this.newMember.name.length == 0;
      },
      role_invalid(){
        return this.newMember.role_id.length == 0;
      },
      email_invalid(){
        return ((this.newMember.email.length == 0) && (true) );
      }
    },
    mounted(){
      this.authenticate();
    },
    methods: {
      authenticate(){
        this.$http.post(this.path + 'authenticate',{
          email: 'admin@email.com', password: '123456'
        }).then(response => {
          this.token = response.body.auth_token;
          this.listJobs();
          this.listMembers();
          
        }, error => {
          console.log(error);
        });
      },
      listJobs(){
        this.$http.get(this.path + 'roles', this.headers)
        .then(response => {
          this.roles = response.body;
        }, error => {
          console.log(error);
        });
      },
      listMembers(){
        this.$http.get(this.path + 'members', this.headers)
        .then(response => {
          this.members = response.body;
        }, error => {
          console.log(error);
        });
      },
      createMember() {
        if(!this.email_invalid && !this.name_invalid && !this.role_invalid){
          this.$http.post(this.path + 'members',{member: this.newMember},this.headers).then(response => {
            this.listMembers();
            this.newMember = {name: '',email: '',role_id: ''  }
            $('#modalMember').modal('hide');
          }, error => { console.log(error); });
        }
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
input,select{
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
