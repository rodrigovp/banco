# -*- encoding : utf-8 -*-
require 'test/unit'

require File.expand_path(File.dirname(__FILE__)) + '/../ruby/dinheiro.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../ruby/conta_corrente.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../ruby/leitor_de_contas_corrente.rb'

class Leitor_de_contas_corrente_test < Test::Unit::TestCase
  
  def setup
    @leitor = Leitor_de_contas_corrente.new
  end
  
  def test_ler_arquivo_vazio
    lista_vazia = @leitor.ler_contas_do File.expand_path(File.dirname(__FILE__)) + '/../arquivos/vazio.csv'
    
    assert_equal [], lista_vazia
  end
  
  def test_ler_arquivo_valido
    lista_com_contas = @leitor.ler_contas_do File.expand_path(File.dirname(__FILE__)) + '/../arquivos/arquivo_valido.csv'
    
    uma_conta_esperada = ContaCorrente.new 123, Dinheiro.new(10000)
    outra_conta_esperada = ContaCorrente.new 456, -20000
    
    assert lista_com_contas.include?(uma_conta_esperada)
    assert lista_com_contas.include?(uma_conta_esperada)
  end
  
  def test_ler_arquivo_com_uma_conta_sem_saldo
    lista_com_contas = @leitor.ler_contas_do File.expand_path(File.dirname(__FILE__)) + '/../arquivos/arquivo_com_um_registro_sem_valor.csv'
    
    uma_conta_esperada = ContaCorrente.new 123, Dinheiro.new(60000)
    outra_conta_esperada = ContaCorrente.new 789, 4000
    
    assert_equal 2, lista_com_contas.size
    assert lista_com_contas.include?(uma_conta_esperada)
    assert lista_com_contas.include?(uma_conta_esperada)
  end
  
  def test_ler_arquivo_contendo_letras_num_dos_registros
    lista_com_contas = @leitor.ler_contas_do File.expand_path(File.dirname(__FILE__)) + '/../arquivos/arquivo_contendo_letras_num_dos_registros.csv'
    
    uma_conta_esperada = ContaCorrente.new 123, Dinheiro.new(60000)
    outra_conta_esperada = ContaCorrente.new 789, 4000
    
    assert_equal 2, lista_com_contas.size
    assert lista_com_contas.include?(uma_conta_esperada)
    assert lista_com_contas.include?(uma_conta_esperada)
  end
  
  def test_ler_arquivo_contendo_uma_linha_vazia
    lista_com_contas = @leitor.ler_contas_do File.expand_path(File.dirname(__FILE__)) + '/../arquivos/arquivo_contendo_uma_linha_vazia.csv'
    
    uma_conta_esperada = ContaCorrente.new 123, Dinheiro.new(60000)
    outra_conta_esperada = ContaCorrente.new 789, 4000
    
    assert_equal 2, lista_com_contas.size
    assert lista_com_contas.include?(uma_conta_esperada)
    assert lista_com_contas.include?(uma_conta_esperada)
  end
end
