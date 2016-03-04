# -*- encoding : utf-8 -*-

require File.expand_path(File.dirname(__FILE__)) + '/leitor_de_arquivos_csv_do_banco.rb'
require File.expand_path(File.dirname(__FILE__)) + '/dinheiro.rb'
require File.expand_path(File.dirname(__FILE__)) + '/conta_corrente.rb'

class Leitor_de_contas_corrente < Leitor_de_arquivos_csv_do_banco
  
  def ler_contas_do arquivo
    contas = []
    registros_arquivo = CSV.read(arquivo)
    registros_arquivo.each { |linha_do_arquivo| adicionar_registro(linha_do_arquivo, contas) }
    contas
  end

  def adicionar_registro linha_do_arquivo, contas
    contas << ler_registro(linha_do_arquivo) if eh_valida linha_do_arquivo
  end

  def ler_registro linha_do_arquivo
    ContaCorrente.new(linha_do_arquivo[0].to_i, Dinheiro.new(linha_do_arquivo[1].to_i))
  end

end
