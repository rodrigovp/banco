# -*- encoding : utf-8 -*-
require 'test/unit'
require File.expand_path(File.dirname(__FILE__)) + '/../ruby/leitor_de_transacoes.rb'

class Leitor_de_transacoes_test < Test::Unit::TestCase
  
  def setup
    @leitor = Leitor_de_transacoes.new
  end
  
  def test_ler_transacoes_de_uma_conta
    lista_com_transacoes = @leitor.ler_transacoes_de_uma_conta 123, File.expand_path(File.dirname(__FILE__)) + '/../arquivos/arquivo_com_varias_transacoes_mesma_conta.csv'
    assert_equal 3, lista_com_transacoes.size
  end
  
end