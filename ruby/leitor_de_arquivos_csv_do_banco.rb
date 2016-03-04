# -*- encoding : utf-8 -*-
require 'csv'

class Leitor_de_arquivos_csv_do_banco
    
  def eh_valida linha_do_arquivo 
    linha_do_arquivo.size == 2 && 
    !linha_do_arquivo[0].nil? && !linha_do_arquivo[1].nil? && eh_inteiro?(linha_do_arquivo[0]) && eh_inteiro?(linha_do_arquivo[1])
  end
  
  def eh_inteiro? string   
     Integer(string) != nil rescue false
  end  
end
