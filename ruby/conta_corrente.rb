# -*- encoding : utf-8 -*-
class ContaCorrente
  
  attr_reader :saldo
  attr_reader :numero
  
  def initialize numero, saldo
    @numero = numero
    @saldo = saldo
  end
  
  def realizar umaTransacao
    @saldo = umaTransacao.movimentar @saldo
  end
  
  def  == outra_conta
    @numero == outra_conta.numero
  end
end
