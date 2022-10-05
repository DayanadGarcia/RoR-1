namespace :dev do
  desc "Configura o db para iniciar o projeto"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o DB...") { %x(rails db:drop) }
      show_spinner("Criando o DB...") { %x(rails db:create) }
      show_spinner("Migrando o DB...") { %x(rails db:migrate) }
      show_spinner("Populando o DB...") { %x(rails db:seed) }
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  private
  def show_spinner(start_msg, stop_msg = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    spinner.auto_spin
    yield
    spinner.success("(#{stop_msg})")
  end

end
