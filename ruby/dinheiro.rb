# -*- encoding : utf-8 -*-

class Dinheiro    
  
  attr_reader :valor
  
  def initialize valor
    @valor =  valor
  end
  
  def == outro_dinheiro
    @valor == outro_dinheiro.valor
  end
   
  def + outro_dinheiro
    ret = @valor + outro_dinheiro.valor
    Dinheiro.new ret
  end
  
  def - outro_dinheiro
    ret = @valor - outro_dinheiro.valor
    Dinheiro.new ret
  end
  
  def eh_negativo
    @valor < 0
  end
  
  def to_s
    @valor.to_s
  end
  
end
