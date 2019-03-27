namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD....") { %x(rails db:drop:_unsafe)}
      show_spinner("Criando BD....") { %x(rails db:create)}
      show_spinner("Migrando BD....") { %x(rails db:migrate)}
      show_spinner("Alimentando BD....") { %x(rails db:seed)}
      show_spinner("Gerando Documentacao....") { %x(rails rdoc)}
    else
      puts 'Você não está no ambiente de desenvolvimento'
    end
  end

  
  private
  def show_spinner(msg_start,msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

  
end
