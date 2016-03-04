# -*- encoding : utf-8 -*-
require 'csv'

class Leitor_de_contas_corrente
  
  def ler_contas_do arquivo 
    contas = []
    array_contas = CSV.read(arquivo)
    array_contas.each { |linha_do_arquivo| adicionar_conta(linha_do_arquivo, contas) }
    contas
  end
  
  private
  def adicionar_conta linha_do_arquivo, contas
    contas << ContaCorrente.new(linha_do_arquivo[0].to_i, linha_do_arquivo[1].to_i) if eh_valida(linha_do_arquivo)
  end
  
  def eh_valida linha_do_arquivo 
    linha_do_arquivo.size == 2 && !linha_do_arquivo[0].nil? && !linha_do_arquivo[1].nil? && eh_inteiro?(linha_do_arquivo[0]) && eh_inteiro?(linha_do_arquivo[1])
  end
  
  def eh_inteiro? string   
     Integer(string) != nil rescue false
  end
end
