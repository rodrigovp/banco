# -*- encoding : utf-8 -*-
require 'test/unit'

require File.expand_path(File.dirname(__FILE__)) + '/../ruby/dinheiro.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../ruby/debito.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../ruby/credito.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../ruby/conta_corrente.rb'

class Conta_corrente_test < Test::Unit::TestCase
  
  def test_movimentar_conta_com_somente_creditos
    conta_corrente = ContaCorrente.new 100, Dinheiro.new(10000)
    um_credito_de_dez_reais = Credito.new Dinheiro.new(1000) 
    um_credito_de_tres_reais = Credito.new Dinheiro.new(300)
    conta_corrente.realizar um_credito_de_dez_reais
    conta_corrente.realizar um_credito_de_tres_reais
    
    assert_equal Dinheiro.new(11300), conta_corrente.saldo
    
  end
  
  def test_movimentar_conta_com_somente_debitos
    conta_corrente = ContaCorrente.new 100, Dinheiro.new(11300)
    um_debito_de_dez_reais = Debito.new Dinheiro.new(1000) 
    um_debito_de_tres_reais = Debito.new Dinheiro.new(300)
    conta_corrente.realizar um_debito_de_dez_reais
    conta_corrente.realizar um_debito_de_tres_reais
    
    assert_equal Dinheiro.new(10000), conta_corrente.saldo
  end
end