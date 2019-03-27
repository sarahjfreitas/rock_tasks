## README

### Requisitos

* RVM (recomendado)

* Ruby 2.4.5

* Postgres (opicional)

### Configurando o ambiente de desenvolvimento

* Configure os dados de acesso ao banco de dados em config/database.yml

* Use a task abaixo para iniciar o banco de dados e gerar a documentação

``` bash

rails db:task

```

### Documentação
Depois de gerada, pode ser encontrada em /doc/rdoc

``` bash

# Gerar documentação
rails rdoc       

# Regerar documentação
rails rerdoc                         

```

### Testes

``` bash

# Migrar banco de dados de teste
rails db:migrate RAILS_ENV=test      

# Executar testes
bundle exec rspec

```

### Autenticação
#### Por padrão o sistema exige a autenticação por token para autorizar as requisicições. Siga os passos abaixo para desabilitar este bloqueio:

* em app/controllers/application_controller.rb - comente a linha 1 (before_action :authenticate_request)

* em app/controllers/authentication_controller.rb - comente a linha 3 (skip_before_action :authenticate_request)

#### Para realizar realizar a autenticação:

* Requisição: POST   /authenticate(.:format) - params :email, :password - retorna o token
* Envie o token em todas as demais requisições


### Access-Control-Allow-Origin
Gem 'rack-cors' foi usada para liberar acesssos externos para api. Está configurada por padrão para aceitar requisições de qualquer origem. Pode ser configurado em config/aplication.rb. Veja a configuração padrão abaixo:

``` ruby

config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :options]
  end
end

```

