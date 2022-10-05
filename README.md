# Ruby on Rails

- RVM - gerenciador de versões do Ruby
    
    rvm list known - lista todas as versões do Ruby na máquina
    
    rvm get head - atualiza a lista de versões
    
    rvm list - lista as versões instaladas localmente
    
    rvm install x.x.x - instala uma versão escolhida
    
    rvm install x.x.x - - default - para instalar uma versão e torná-la padrão
    
    rvm use x.x.x - torna uma versão atual e padrão
    

> Ruby é uma linguagem interpretada
> 
> - ruby exerc_1.rb - esse comando interpreta o arquivo ruby
- REPL
    
    Interpretador de código em tempo real via shell
    
- IRB - Interactive Ruby Shell
    
    É um REPL - é um shell que interpreta instruções Ruby conforme é escrito no terminal
    
    No terminal digite irb para iniciar o shell do irb
    
    Exit para sair do irb
    
- PRY
    
    <aside>
    💡 Para instalar o Pry:
    
    dentro de Gemfile: `gem “pry-rails”` + bundle no terminal
    
    ou
    
    `gem install pry`
    
    É um REPL
    
    Parecido com o IRB, porém contém os highlightings e identação automática
    
    </aside>
    
- Variáveis em Ruby
    
    declara variável usando-a: nome = “dayana” - ruby infere o tipo na declaração
    
    para saber o tipo da var: nome_da_var.class (método .class)
    

```ruby
puts - "imprime na tela e quebra linha"
print - "imprime e não quebra linha"

gets - pega o que foi digitado na tela e atribui à var
ex:
puts "digite um número:"

num = gets.chomp.to_i
# captura o valor digitado, remove a formatação, caso tenha
# e tranforma em inteiro para comparar, pois o ruby sempre 
# captura strings

# Condicionais::

#if

if x > 2
	puts "x é maior que 2"
end

#unless

x = 1
unless x >= 2 # se esse comando for false, executa o que vem abaixo
	puts "x é menor que 2"
else
	puts "x é maior que 2"
end

#case

idade = 5
case idade
when 0..2
	puts "bebê"
when 3..12
	puts "criança"
when 13..18
	puts "adolescente"
else
	puts "adulto"
end

#condicional ternária

sexo == "M" ? (puts "masculino") : (puts "feminino")

#repetição

#while
num = 5
i = 0

while i < num do
	puts "Contando..." + i.to_s # transforma em string pra concatenar
	i += 1
end

#each
(0..5) each do |i|
	puts "O valor lido foi: " + i.to_s
end
#vai imprimir de 0 à 5, conforme o range, incrementado automaticamente
#orange pode ser substituído por um array

arr = [1,2,3,4,5]

arr.each do |item|
	puts item
end
```

<aside>
💡 Arrays

```ruby
#Formas de declarar arrays
v = [1,2,3,4,5,6]
#ou
v = []
#ou
v = Array.new
v.push(10)
v.push(11)]

#Acessar valores do array:
puts v[0]
```

</aside>

<aside>
💡 Hashes - lista do tipo chave e valor/objeto/dicionário

```ruby
#formas de criar hashes:
h = { "x" => 15, "curso" => "rails" }
h = { "x": 15, "curso": "rails" }

#forma de pegar valores de hashes:
h[:curso]
#saída:
"rails"
```

</aside>

<aside>
💡 Strings

```ruby
a = "Curso"
b = "Rails"

puts a + b = CursoRails #gera um novo objeto na memória
puts a << b = CursoRails #modifica o a, não gera um novo obj

puts a = CursoRails # novo valor de a

#interpolação de variáveis

#Só funciona a interpolação em strings criadas com aspas duplas
c = "Rails"
txt = "Curso de #{c}"
```

</aside>

<aside>
💡 Symbols - são strings imutáveis -  :exemplo

```ruby
a = "a"
puts a.object_id - #imprime o identificador/endereço na memória
#se for criado varias variaveis com mesmo valor, essa variavel
#terá cada uma um endereço diferente na memória, e isso não é bom
#para isso temos os symbols:
:a.object_id - #vai ter um lugar unico na memória, mesmo sendo usado depois
#para criar hashes com symbols:
h = {:a => "oi"}
#ou
h = {a: "oi"}
```

</aside>

<aside>
💡 Initialize

```ruby
class Pessoa
	def initialize
		puts "Inicializando..."
	end

	def falar(texto)
		texto
	end
end

#o método initialize não depende de ser invocado para
#executar, ele é executado automaticamente na hora
#que uma instancia da classe é criada
```

</aside>

<aside>
💡 Self - é o próprio obj, ou seja, o obj instanciado

```ruby
class Pessoa
	def meu_id
		"Meu id é o #{self.object_id}"
	end
end
```

Também é possível reabrir classes já definidas no Ruby e usar o self:class String
	def inverter
		self.reverse
	end
end

#essa classe String já existe no ruby
#eu estou reabrindo ela e definindo um novo método
#esse método inverte as letras da string

</aside>

<aside>
💡 Variáveis de instancia - existem apenas na instancia do obj - @

> Ou seja, cada obj possui seus proprios valores em tais variaveis
> 

---

> As var de instancia são precedidas de um @
> 

```ruby
class Pessoa

	def initialize(nome_fornecido = "Indigente")
		@nome = nome_fornecido
	end

	def imprimir_nome
		@nome
	end

end

#agora que foi definido uma ver de instancia eu posso
#usar ela na minha classe em todos os métodos
#o valor atibuido a ela, só funciona com esse valor 
#no obj que instanciou ela
```

</aside>

<aside>
💡 Accessors - attr_accessor - parecido com getters e setters

> Servem como atalho p declaração de atributo de uma classe
> 

```ruby
class Pessoa
	attr_accessor :nome
	#defini uma var que pode ser lida e escrita
end

p1 = Pessoa.new
p1.nome = "Dayana" #setter
p1.nome #getter
```

</aside>

<aside>
💡 Herança

```ruby
class Pessoa
	attr_accessor :nome, :email
#defini uma pessoa genérica
end

class Pessoa_fisica < Pessoa
	attr_accessor :cpf
	
	def falar(texto)
		texto
	end
#esta herdando de pessoa seus atributos
end

class Pessoa_juridica < Pessoa
	attr_accessor :cnpj

	def pagar_fornecedor
		"Pagando fornecedor..."
	end
#esta herdando de pessoa seus atributos
end

#defini pessoa generica
p1 = Pessoa.new
#setter
p1.nome = "Dayana"
p1.email = "day@test.com"
#getter
puts  p1.nome
puts p1.email
```

No Ruby não existe herança múltipla, não é possível herdar de varias classes ao mesmo tempo

</aside>

<aside>
💡 Métodos de classe - é o tipo de método que não precisa instanciar

```ruby
class Pessoa

	def falar #metodo de instancia
		"Olá, pessoal!"
	end

	def self.gritar(texto) #metodo de classe
		"#{texto}!!!!"
	end

end

puts Pessoa.gritar("Hello")
#não precisa instanciar para invocar o método
#por causa do self
```

</aside>

<aside>
💡 Módulos

> Podem armazenar métodos, constantes, outros módulos e classes
> 

> é diferente de obj, Não instancia um módulo
> 

> é diferente de classe, não pode criar módulos que herdam desse módulo
> 

<aside>
💡 Bom lugar para armazenar constantes num local centralizado

</aside>

<aside>
💡 o módulo é incluído (mixin) na classe ou obj para que possa ser usado todos seus recursos

> módulos agem como *namespaces -* e permiti que seja definido métodos cujos nomes não vão colidir com os nomes definidos em outras partes do sistema
> 
</aside>

```ruby
#pasta modulos/pagamento.rb
module Pagamento
	PI = 3.14
end
```

```ruby
relative_require "pagamento" # importando o módulo

include Pagamento # de pagamento inclua Pagamento
# tudo o que tiver em Pagamento será incluído

puts PI 
# para ser usado a constante definida no módulo
# é importante usar o include para dizer o que estou
# querendo incluir
```

```ruby
relative_require "pagamento" # importando o módulo

puts Pagamento::PI # essa notação :: é comum aos módulos
# nesse caso não precisa colocar o include, pois já
# está sendo feito o caminho do que eu quero no puts
# porém nesse caso só estou trazendo a constante, e
# não o módulo Pagamento TODO!
```

</aside>

<aside>
💡 Gems - bibliotecas Ruby

> São bibliotecas ou conjuntos de arquivos Ruby, reutilizáveis, etiquetados com um nome e uma versão
> 

[https://rubygems.org/](https://rubygems.org/)

- gem list - vai listar todas as gems que estão instaladas na app
- gem list <nome_da_gem> - vai listar uma gem específica
- gem list <nome> - -remote - vai listar todas as gems com esse nome no remoto
- gem list <nome> - -remote - -all - vai listar todas as gems com esse nome e todas as versões dela no remoto

> Para instalasr uma gem:
> 
> 
> gem install <nome> ex…: gem install rails
> 
> Para instalar uma versão específica da gem:
> 
> gem install <nome> -v <x.x.x> ex…: gem install rails -v 5.2.0
> 

> Para remover uma gem:
> 
> 
> gem uninstall <nome>
> 
> Para remover versões antigas da gem instalada:
> 
> gem cleanup
> 
> Para remover versões antigas de uma gem específica:
> 
> gem cleanup <nome>
> 
> Verifica versões antigas que serão removidas:
> 
> gem cleanup -d
> 

> Utilizando uma gem, ex:
> 
> 
> instale: `gem install cpf_utils`
> 
> importe no projeto: `require “cpf_utils”`
> 
> use a gem: `CpfUtils.cpf`
> 
</aside>

<aside>
💡 Bundler -  É uma gem que acaba com o dependencies hell - problema de dependências

> Instale o bundler: gem install bundler
> 

> Crie o arquivo Gemfile se não tiver
> 

> Adicione um repositório: `source “[https://rubygems.org/](https://rubygems.org/)”`
> 

> Adicione as gems que deseja instalar:
> 
> 
> gem ‘faker’
> 
> gem ‘cpf_utils
> 

> rode o comando `bundle install` para instalar as gems e suas dependências
> 

<aside>
💡 dá pra usar só `bundle` para intalar as gems

</aside>

> As dependências das gems, versões e informações sobre todas as gems do projeto ficam armazenadas na Gemfile.lock
> 
</aside>

<aside>
💡 **Sistema comum de versionamento:**

X.Y.Z (Major.Minor. Patch) : gem “cpf_utils”, “1.0.0”

Patch - correções

Minor - alterações pequenas, ex: mudança no idioma, etc

Major - alterações grandes, impacto na forma de usar, etc

> Ao instalar uma gem, se não for informada a versão, a mais atual será instalada
> 

Versão exata: gem “cpf_utils”, “1.0.1”

Versão maior ou igual a:  gem “cpf_utils” “>= 1.0.1”

> Versão parcial atual/aproximadamente:  gem “faker”, “~>1.6” - nesse caso vai variar até 1.9, a variação sempre vai até a última casa que indiquei, ex: gem “faker”, “~>1.0.2”, vai até 1.0.9
> 
</aside>

<aside>
💡 **Gerando Aplicação Rails**

> a partir de uma versão específica: `rails _5.2_ new my_app_name`
> 

> a partir da versão mais atual: `rails new my_app_name`
> 

**Banco de Dados**

> Para saber qual db estou usando: config/database.yml
> 

> para adaptar o db, podemos digitar database.yml e o nome do banco que queremos usar, vai ter exemplos prontos no github da configuração para o arquivo database.yml
> 
</aside>

<aside>
💡 Prototipando…

> Modelo do software
> 
</aside>

<aside>
💡 Scaffold

> é um generator do rails que permite criar um CRUD para uma tabela
> 

Como usar o generate para scaffold do rails:

`rails generate scaffold <Nome_da_model> <campo:tipo> <campo:tipo> . . .` 

<aside>
💡 Por convenção o Model é sempre escrito em letra maiúscula e no singular: Coin, Person, Class, Food…

</aside>

Sendo assim…

```ruby
rails generate scaffold Coin description:string acronym:string url_image:string
# ou
rails generate scaffold Coin description acronym url_image
# qnd não definimos o tipo, ele entende ser string
# caso seja outro tipo, é necessário definir
```

> Esse comando anterior gera os seguintes arquivos:
> 
> - as views
> - o controller
> - o model
> - a migration
</aside>

<aside>
💡 **Active Record** - orm/framework responsável por trabalhar com os dados no rails

> É o M do MVC - O Model
> 
> 
> É a camada de código responsável pela lógica de dados e negócio
> 
> Esse framework está contido no rails
> 

<aside>
💡 Não confunda o **padrão** active record com o **framework** active record!

O framework é a implementação do padrão active record

</aside>

- **ORM** - Object-Relational Mapping
    
    é uma técnica que mapeia os dados em um DB para classes/objetos na programação, nesse caso é o active record, que se baseia em um padrão chamado active record tbm
    
- **Migrations**
    - características do active record, que permite escrever as tabelas do db usando a ling Ruby
    - dessa forma é possível manipular o db sem utilizar o sql
    - sempre que criamos migrations, temos que faze-la aplicar as mudanças ao db
    
    > Para isso usamos tasks do rails predefinidas
    > 
    > 
    > para conhecer todas as tasks digite `rails -T`
    > 
    > as mais usadas são:
    > 
    > ```ruby
    > rails db:create # cria db
    > rails db:drop # apaga o db
    > rails db:migrate # executa as migrations
    > rails db:rollback # desfaz a última migration
    > 
    > ```
    > 
- **Rails dbconsole** - é tipo o pgAdmin/workbanch
    - comando usado para se conectar ao db e executar comandos para inspecioná-lo
    - para usar basta digitar `rails dbconsole ou rails db`
</aside>

<aside>
💡 **Enviroments e trocar porta** - development, tests, production

para alterar a portão padrão do servidor, pelo arquivo puma.rb:

```ruby
# .env
PORT=10524
# config/puma.rb
port ENV['PORT']
```

- Para levantar o servidor em ambiente de produção:
    
    `RAILS_ENV=production rails s` ou 
    
    `raisl s -e production`
    

Se não for definido o ambiente, ele abre o ambiente de desenvolvimento

</aside>

<aside>
💡 **Fluxo MVC**

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/37dcd2d8-8bcb-4478-a73e-b141f8d50216/Untitled.png)

**Generate**

> No Ruby temos os generates, por exemplo para criar os controllers, models, etc, exemplo de criação de um controller: `rails g controller nome_do_controller`
> 

> Para criar controller com uma action definida:
> 
> 
> `rails g controller welcome index`
> 
> quando já definimos uma action na criação de um generate controller, automaticamente a view da action é criada tbm
> 
</aside>

<aside>
💡 **Helpers**

> são métodos prontos que podem ser usados nas views
> 

Exemplo de helper: `link_to`

As views são escritas em Ruby + html

```ruby
<ul>
  <li>
    <%= link_to "Cadastro de Moedas", coins_path %>
  </li>
</ul>
#utilização do helper link_to...
```

<aside>
💡 **Para saber quais rotas tenho no projeto:**

`localhost:3545/rails/info/routes`

</aside>

Exemplo de **helper**: `image_tag`

```ruby
<%= image_tag coin.url_image, width: 25, heigth: 25 %>
#redenriza a imagem com o tamanho fixo
```

<aside>
💡 **Criando Helpers . . .**

dentro da pasta helpers, tem um arq para cada recurso

```ruby
#em helpers/application_helper.rb
module ApplicationHelper
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end
end
#esse helper formata a data para o modo brasileiro
#pode ser usado em qualquer view,pq foi definido no
#no helper da aplicação(geral)
```

> **Para usar/chamar o Helper. . .**
> 

```ruby
<p>
	<strong>Data: </strong><%= data_br(Date.today) %>
</p>
```

</aside>

**Mais um exemplo de helper:**

```ruby
#Helper que exibe o nome da app
def nome_aplicacao
	"CRYPTO WALLET APP"
end
```

```ruby
#chamada do helper na view
<p><%= nome_aplicacao %></p>
#essa notação é importante para identificar que se
#trata de um helper...
```

</aside>

<aside>
💡 Rotas - **CRUD**

```ruby
#em config/routes.rb
Rails.application.routes.draw do
  get 'welcome/index'
  resources :coins

  root to: "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
```

> adiciona esse trecho `root to: "welcome#index"`
para que a rota raiz seja essa
> 

</aside>

<aside>
💡 Models no Rails Console:

```ruby
rails c
#para abrir o rails console
```

```ruby
c = Coin.new
c.description: "Dash"
c.acronym: "DASH"
c.url_image: "http://"
c.save!
#declara que estou preenchendo meu banco com novos dados
#outra forma de fazer com o create direto:
c = Coin.create!(
	description: "Dash",
	acronym: "DASH",
	url_image: "http://"
)
```

</aside>

<aside>
💡 Identificando o ambiente atual

```ruby
#dentro de rails c, digite:
Rails.env
#esse comando retorna o ambiente atual
```

</aside>

<aside>
💡 **Query Params**

> parâmetros enviados ao servidor pela URL
> 
> 
> !! Para isso: Logo após a URL padrão use o símbolo de ? seguido de um par chave=valor com o que se quer passar ao servidor, ex: `localhost:3000/?nome=dayana`
> 
> Para pegar os valores digitados como query params:
> 
> @name = param[:chave-colocada-na-url]
> 
> o  @name é uma variável de instância que poderá ser usada em partes do obj instanciado
> 
</aside>

<aside>
💡 **Partials** - é tipo components do react, partes reutilizáveis da view

> É parte de renderização de templates
> 
> 
> Permite que seja renderizada uma view dentro de outra!
> 
> Para isso: Crie um arquivo `_nomeDaFuncao.html.erb`
> 
> O uso do underline antes do nome do arq identifica ele como uma partial. Para utilizar esse partial em alguma view, é simples: `<%= render "nomeDaFuncao" %>` usa a notação do Ruby para helper, e usa o **helper** **render**
> 
> ex:
> 
> `_menu.html.erb` - criando o partial
> 
>  `<%= render "menu" %>` - usando o partial com o helper render
> 
</aside>

<aside>
💡 **Layouts** - template, é onde as views estão contidas

> As views são partes do layout
> 

Também é possível criar outros layout, dentro da pasta de layout: `adm.html.erb` e para que seja renderizado em partes do código, devemos especificar no controller com as infos que queremos renderizar, caso não seja especificado um layout, então o layout padrão: `application.html.erb` será o utilizado:

```ruby
#especificando um layout diferente do padrão:
class CoinsController < ApplicationController
  layout "adm" #esse layout será renderizado!

	before_action :set_coin, only: %i[ show edit update destroy ]
```

</aside>

<aside>
💡 Seeds.rb → Esse arq que está dentro da pasta db guarda as infos iniciais para preencher o banco

```ruby
#em seeds.rb
Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/non_2x/bitcoin-logo-color-illustration-png.png"
)

Coin.create!(
  description: "Dash",
  acronym: "DASH",
  url_image: "https://www.pngall.com/wp-content/uploads/10/Dash-Crypto-Logo-PNG-Cutout.png"
)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  url_image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png"
)
```

Com a seed criada no terminal digite:

`rails db:drop db:create db:migrate db:seed`

Isso são as Rake Tasks ☝️ - Para listar todas digite: rails -T

</aside>

<aside>
💡 Criando Rake Tasks. . .

> No terminal: `rails g task dev setup` - dev é correspondente ao db das rake tasks pré definidas, setup é correspondente ao que vem depois dos dois pontos
> 

> Ao criar uma rake tasks, é gerado um arq com o nome dado, no caso: `dev.rake`, que está localizado dentro da pasta `lib/task/dev.rake`, contendo:
> 
> 
> ```ruby
> #lib/task/dev.rake
> namespace :dev do
>   desc "TODO" #descrição da função
>   task setup: :environment do
>   end
> 
> end
> ```
> 
> configurado para fazer a população inicial do banco de dados:
> 
> ```ruby
> namespace :dev do
>   desc "Configura o db para iniciar o projeto"
>   task setup: :environment do
>     puts %x(rails db:drop db:create db:migrate db:seed)
>   end
> 
> end
> ```
> 
>  O comando:
> 
>   `puts %x(rails db:drop db:create db:migrate db:seed)`
> 
> dropa, cria, cria a estrutura das tabelas e alimenta o db
> 
</aside>
