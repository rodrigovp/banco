# -*- encoding : utf-8 -*-

require File.expand_path(File.dirname(__FILE__)) + '/leitor_de_arquivos_csv_do_banco.rb'
require File.expand_path(File.dirname(__FILE__)) + '/dinheiro.rb'
require File.expand_path(File.dirname(__FILE__)) + '/credito.rb'
require File.expand_path(File.dirname(__FILE__)) + '/debito.rb'

class Leitor_de_transacoes < Leitor_de_arquivos_csv_do_banco
  
  def ler_transacoes_de_uma_conta numero_conta, arquivo
    registros_lidos = []
    registros_arquivo = CSV.read(arquivo)
    registros_arquivo.each { |linha_do_arquivo| selecionar_transacoes(linha_do_arquivo, numero_conta, registros_lidos) }
    registros_lidos
  end

  def selecionar_transacoes linha_do_arquivo, numero_conta, registros_lidos
    if eh_valida(linha_do_arquivo) && transacao_pertence_a_conta(numero_conta, linha_do_arquivo) then
      valor_transacao = Dinheiro.new linha_do_arquivo[1].to_i
      valor_transacao.eh_negativo ? registros_lidos << Debito.new(valor_transacao) : registros_lidos << Credito.new(valor_transacao)
    end
  end

  def transacao_pertence_a_conta numero_conta, linha_do_arquivo
    numero_conta.to_i == linha_do_arquivo[0].to_i
  end
end
