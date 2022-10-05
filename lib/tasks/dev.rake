namespace :dev do
  desc "Configura o db para iniciar o projeto"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o DB...") { %x(rails db:drop) }
      show_spinner("Criando o DB...") { %x(rails db:create) }
      show_spinner("Migrando o DB...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)# chama o rake criado abaixo...
      %x(rails dev:add_mining_types)# chama o rake criado abaixo...
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/non_2x/bitcoin-logo-color-illustration-png.png"
        },
        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://www.pngall.com/wp-content/uploads/10/Dash-Crypto-Logo-PNG-Cutout.png"
        },
        {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png"
        }
      ]
    
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do

      mining_types = [
        {
          description: "Proof of Work", acronym: "PoW"
        },
        {
          description: "Proof of Stake", acronym: "PoS"
        },
        {
          description: "Proof of Capacity", acronym: "PoC"
        }
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
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
