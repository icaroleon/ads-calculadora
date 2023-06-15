class Professor
  attr_accessor :nome, :regime_pagamento, :salario_mensal, :numero_horas, :valor_hora, :valor_contrato

  def initialize(nome, regime_pagamento)
    @nome = nome
    @regime_pagamento = regime_pagamento
  end

  def valor_a_receber
    case @regime_pagamento
    when 'CLT'
      @salario_mensal
    when 'Horista'
      @numero_horas * @valor_hora
    when 'PJ'
      @valor_contrato
    else
      'Regime de pagamento inválido.'
    end
  end
end

puts "Insira o nome do professor:"
nome = gets.chomp
puts "Insira o regime de pagamento (CLT, Horista, PJ):"
regime_pagamento = gets.chomp

professor = Professor.new(nome, regime_pagamento)

case regime_pagamento
when 'CLT'
  puts "Insira o salário mensal:"
  professor.salario_mensal = gets.chomp.to_f
when 'Horista'
  puts "Insira o número de horas trabalhadas:"
  professor.numero_horas = gets.chomp.to_f
  puts "Insira o valor da hora de trabalho:"
  professor.valor_hora = gets.chomp.to_f
when 'PJ'
  puts "Insira o valor do contrato:"
  professor.valor_contrato = gets.chomp.to_f
else
  puts "Regime de pagamento inválido."
end

puts "Conforme o cálculo realizado, o professor #{professor.nome} vai receber #{professor.valor_a_receber}"
