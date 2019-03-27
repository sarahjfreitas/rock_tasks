<template>
  <div class="row">
    <app-member-box v-for="m in members" :key="m.id" :member="m" :fnEdit="editMember"></app-member-box>
    <div class="modal" tabindex="-1" role="dialog" id="modalMember" ref="modalMember" modo="new">
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
                  <input type="text" class="form-control" placeholder="Nome" v-model="newMember.name" :class="{'is-invalid': name_invalid}" @input="validate_name">
                  <div class="invalid-feedback">Preencha o nome</div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="E-mail" v-model="newMember.email" :class="{'is-invalid': email_invalid}" @input="validate_email" >
                  <div class="invalid-feedback">E-mail inválido</div>
                </div>
                <div class="form-group">
                  <select class="form-control" placeholder="Função de trabalho" v-model="newMember.role_id" :class="{'is-invalid': role_invalid}"  @input="validate_role">
                    <option v-for="j in roles" :key="j.id" :value="j.id">{{j.name}}</option>
                  </select>
                  <div class="invalid-feedback">Selecione a função</div>
                </div>
                <div class="submitContainer">
                  <button type="button" class="btn btn-primary" @click="submitMemberForm()">Criar Membro da Equipe</button>
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
  import 'vuejs-noty/dist/vuejs-noty.css'
/*
// Basic alert
this.$noty.show("Hello world!")

// Success notification
this.$noty.success("Your profile has been saved!")

// Error message
this.$noty.error("Oops, something went wrong!")

// Warning
this.$noty.warning("Please review your information.")

// Basic alert
this.$noty.info("New version of the app is available!")

*/
  export default {
    components: {
      AppMemberBox : MemberBox
    },
    data(){
      return {
        members: [],
        newMember: {name: '',email: '',role_id: ''  },
        edit_id: 0,
        token: '',
        roles: [],
        path: 'http://localhost:3000/',
        name_invalid : false,
        role_invalid : false,
        email_invalid : false
      };  
    },
    computed: {
      headers(){
        return {
          headers: {'Authorization' : this.token }
        };
      },
      any_invalid(){
        return this.name_invalid || this.email_invalid || this.role_invalid;
      }
    },
    mounted(){
      this.authenticate();
      $(this.$refs.modalMember).on("show.bs.modal", this.resetValidation)    
    },
    methods: {
      authenticate(){
        this.$http.post(this.path + 'authenticate',{
          email: 'admin@email.com', password: '123456'
        }).then(response => {
          this.token = response.body.auth_token;
          this.listJobs();
          this.listMembers();          
          this.$noty.info("Usuário padrão foi autenticado.")
        }, error => {
          this.$noty.warning("Não foi possível autenticar. Continue com a versão offline ou tente recarregar a pagina.")
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
      submitMemberForm(){
        if($('#modalMember').attr('modo') == 'new'){
          this.createMember();
        }
        else if($('#modalMember').attr('modo') == 'edit'){
          this.updateMember();
        }
      },
      createMember() {
        this.validate_all();
        if(this.any_invalid){
          this.$noty.error("Verifique os campos inválidos e tente novamente.")
          return;
        }
        this.$http.post(this.path + 'members',{member: this.newMember},this.headers).then(response => {
          this.listMembers();
          this.newMember = {name: '',email: '',role_id: ''  }
          $('#modalMember').modal('hide');
          this.$noty.success("Membro cadastrado com sucesso.")
        }, error => {      
          if(error.status = 422){
            this.$noty.error(error.body.message)
          }
          else{
            console.log(error);
          }
        });        
      },
      updateMember() {
        this.validate_all();
        if(this.any_invalid){
          this.$noty.error("Verifique os campos inválidos e tente novamente.")
          return;
        }
        this.$http.put(this.path + 'members/'+this.edit_id,{member: this.newMember},this.headers).then(response => {
          this.listMembers();
          this.newMember = {name: '',email: '',role_id: ''  }
          $('#modalMember').modal('hide');
          this.$noty.success("Membro editado com sucesso.")
        }, error => {      
          if(error.status = 422){
            this.$noty.error(error.body.message)
          }
          else{
            console.log(error);
          }
        });        
      },
      validate_name(){
        this.name_invalid = this.newMember.name.length < 3 || this.newMember.name.length > 254;
      },
      validate_email(){
        this.email_invalid = this.newMember.email.length < 3 || this.newMember.email.length > 254;
        var re = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i;
        this.email_invalid = this.email_invalid || !re.test(String(this.newMember.email).toLowerCase());
      },
      validate_role(){
        this.role_invalid = this.newMember.role_id.length == 0;
      },
      validate_all(){
        this.validate_name();
        this.validate_email();
        this.validate_role();
      },
      resetValidation(){
        this.name_invalid = false;
        this.role_invalid = false;
        this.email_invalid = false;
      },
      editMember(id){
        this.edit_id = id;
        this.$http.get(this.path + 'members/' + id , this.headers)
        .then(response => {
          this.newMember = response.body;
          $('#modalMember').attr('modo','edit');
          $('#modalMember .modal-title').text('Editar Membro');
          $('#modalMember .btn').text('Editar Membro da Equipe');
          $('#modalMember').modal();
        }, error => {
          this.$noty.error('Membro não encontrado')
        });
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
.modal-title {
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
select {
  -moz-appearance:none; /* Firefox */
  -webkit-appearance:none; /* Safari and Chrome */
  appearance:none;
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
