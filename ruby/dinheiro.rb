# -*- encoding : utf-8 -*-

class Dinheiro    
  
  attr_reader :valor
  
  def initialize valor
    @valor =  valor
  end
  
  def == outroDinheiro
    @valor == outroDinheiro.valor
  end
   
  def + outroDinheiro
    ret = @valor + outroDinheiro.valor
    Dinheiro.new ret
  end
  
  def - outroDinheiro
    ret = @valor - outroDinheiro.valor
    Dinheiro.new ret
  end
  
  def to_s
    ret = @valor / 100.to_f
    "R$ " + ret.to_s
  end
  
end
