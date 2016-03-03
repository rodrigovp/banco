# -*- encoding : utf-8 -*-
require 'test/unit'
require 'bigdecimal'

require File.expand_path(File.dirname(__FILE__)) + '/../ruby/dinheiro.rb'

class DinheiroTest < Test::Unit::TestCase

  def test_igualdade
    umValor = Dinheiro.new 10
    outroValor = Dinheiro.new 10
    
    assert_equal umValor, outroValor
  end
  
  def test_adicao_de_valores
    umValor = Dinheiro.new 10
    parcela = Dinheiro.new 1
    
    valorEsperado = Dinheiro.new 11.0
    valorObtido = umValor + parcela
    
    assert_equal valorEsperado, valorObtido
  end
  
  def test_subtracao_de_valores
    umValor = Dinheiro.new 100
    subtraendo = Dinheiro.new 1
    
    valorEsperado = Dinheiro.new 99
    valorObtido = umValor - subtraendo
    
    assert_equal valorEsperado, valorObtido
  end
    
  def test_to_s
    valor = Dinheiro.new 1034
    assert_equal "10.34", valor.to_s
  end
end
