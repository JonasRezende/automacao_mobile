# Requisitos de bibliotecas externas usadas no projeto
require 'appium_lib'
require 'rspec'
require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'
require 'faker'
require 'yaml'

# Carrega os arquivos internos do projeto (suporte, banco de dados, facilitadores)
require_relative 'utils'         # Funções auxiliares (ex: clique, digitação, etc)
require_relative 'initializer'   # Módulo Actions que facilita acesso às telas
require_relative 'database'      # Dados fictícios para os testes

# Torna os métodos do RSpec disponíveis (como o "expect")
include RSpec::Matchers

# Variáveis de ambiente para definir a plataforma e o ambiente
platform = ENV['PLATFORM'] || 'android'        # Define 'android' como padrão
environment = ENV['ENVIRONMENT'] || 'Homolog'  # Define 'Homolog' como padrão

# Define o arquivo de capabilities de acordo com a plataforma (Android ou iOS)
caps_file = platform == 'ios' ? 'capabilities_ios.yml' : 'capabilities.yml'

# Carrega o arquivo de capabilities selecionado
caps = YAML.load_file(File.join(File.dirname(__FILE__), caps_file))

# Define as opções que serão usadas pelo Appium
opts = {
  caps: caps['caps'],                          # Capabilities do arquivo .yml
  appium_lib: {
    server_url: 'http://localhost:4723'        # URL do servidor Appium
  }
}

# Inicializa o driver do Appium e permite usar métodos como "find_element" direto
$driver = Appium::Driver.new(opts, true)
Appium.promote_appium_methods Object

# Deixa o módulo Actions acessível nos steps
World(Actions)
