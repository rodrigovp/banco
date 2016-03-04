# -*- encoding : utf-8 -*-
class ContaCorrente
  
  attr_reader :saldo
  
  def initialize numero, saldo
    @numero = numero
    @saldo = saldo
  end
  
  def realizar umaTransacao
    @saldo = umaTransacao.movimentar @saldo
  end
end
