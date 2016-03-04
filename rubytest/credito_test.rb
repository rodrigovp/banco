# -*- encoding : utf-8 -*-
require 'test/unit'

require File.expand_path(File.dirname(__FILE__)) + '/../ruby/credito.rb'

class Credito_test < Test::Unit::TestCase
  
  def test_movimentar_saldo
    um_real = Dinheiro.new 100
    credito = Credito.new um_real
    
    saldo_antigo = Dinheiro.new 200
    novo_saldo = credito.movimentar saldo_antigo
    saldo_esperado = Dinheiro.new 300
    
    assert_equal saldo_esperado, novo_saldo
  end
end
