# -*- encoding : utf-8 -*-
require 'test/unit'

require File.expand_path(File.dirname(__FILE__)) + '/../ruby/dinheiro.rb'

class DinheiroTest < Test::Unit::TestCase

  def test_igualdade
    um_valor = Dinheiro.new 10
    outro_valor = Dinheiro.new 10
    
    assert_equal um_valor, outro_valor
  end
  
  def test_adicao_de_valores
    um_valor = Dinheiro.new 10
    parcela = Dinheiro.new 1
    
    valor_esperado = Dinheiro.new 11
    valor_obtido = um_valor + parcela
    
    assert_equal valor_esperado, valor_obtido
  end
  
  def test_subtracao_de_valores
    um_valor = Dinheiro.new 100
    subtraendo = Dinheiro.new 1
    
    valor_esperado = Dinheiro.new 99
    valor_obtido = um_valor - subtraendo
    
    assert_equal valor_esperado, valor_obtido
  end
  
  def test_valor_negativo
    negativo = Dinheiro.new -1
    zero = Dinheiro.new 0
    positivo = Dinheiro.new 1
    
    assert_equal true, negativo.eh_negativo
    assert_equal false, zero.eh_negativo
    assert_equal false, positivo.eh_negativo
  end
    
  def test_to_s
    valor = Dinheiro.new 1034
    assert_equal "1034", valor.to_s
  end
end
