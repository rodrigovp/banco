# -*- encoding : utf-8 -*-

class Credito
  
  def initialize valor
    @valor = valor
  end
  
  def movimentar saldo_da_conta
    saldo_da_conta += @valor
  end
end
