# -*- encoding : utf-8 -*-
require 'test/unit'
require File.expand_path(File.dirname(__FILE__)) + '/../ruby/dinheiro.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../ruby/debito.rb'

class Debito_test < Test::Unit::TestCase
  def test_debitar_saldo_mantendo_o_seu_valor_positivo
    debito = Debito.new(Dinheiro.new(200))

    saldo_antigo = Dinheiro.new 300
    novo_saldo = debito.movimentar saldo_antigo
    saldo_esperado = Dinheiro.new 100

    assert_equal saldo_esperado, novo_saldo
  end

  def test_debitar_saldo_zerando_o_saldo
    dois_reais = Dinheiro.new 200
    debito = Debito.new dois_reais

    saldo_antigo = dois_reais
    novo_saldo = debito.movimentar saldo_antigo
    saldo_esperado = Dinheiro.new 0

    assert_equal saldo_esperado, novo_saldo
  end

  def test_debitar_saldo_positivo_tornando_o_negativo_e_aplicando_multa
    debito = Debito.new(Dinheiro.new(300))

    saldo_antigo = Dinheiro.new 200
    novo_saldo = debito.movimentar saldo_antigo
    saldo_esperado = Dinheiro.new -600

    assert_equal saldo_esperado, novo_saldo
  end

  def test_debitar_saldo_negativo_e_aplicando_multa
    debito = Debito.new(Dinheiro.new(300))

    saldo_antigo = Dinheiro.new -600
    novo_saldo = debito.movimentar saldo_antigo
    saldo_esperado = Dinheiro.new -1400

    assert_equal saldo_esperado, novo_saldo
  end
end