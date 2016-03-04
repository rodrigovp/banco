# -*- encoding : utf-8 -*-
class Debito
  
  def initialize valor
    @valor = valor
  end
  
  def movimentar saldo_da_conta
    saldo_da_conta -= @valor
    if saldo_da_conta.eh_negativo then saldo_da_conta = aplicar_multa_em saldo_da_conta end
    saldo_da_conta
  end
  
  private 
  
  def aplicar_multa_em saldo_da_conta
    saldo_da_conta += multa
  end
  
  def multa
    Dinheiro.new -500
  end
end
