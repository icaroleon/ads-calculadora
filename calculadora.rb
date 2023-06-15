class Teacher
  attr_accessor :name, :contract_type, :mensal_income, :work_hours, :hour_value, :contract_value

  def initialize(name, contract_type)
    @name = name
    @contract_type = contract_type
  end

  def valor_a_receber
    case @contract_type
    when 'CLT'
      @mensal_income
    when 'Horista'
      @work_hours * @hour_value
    when 'PJ'
      @contract_value
    else
      'Regime de pagamento inválido.'
    end
  end
end

puts "Nome do professor:"
name = gets.chomp
puts "Qual o regime de pagamento (CLT, Horista, PJ)?"
contract_type = gets.chomp

unless ['CLT', 'Horista', 'PJ'].include?(contract_type)
  puts "Regime de pagamento inválido. Favor reinserir as informações."
  return
end

teacher = Teacher.new(name, contract_type)

case contract_type
when 'CLT'
  puts "Insira o salário mensal:"
  teacher.mensal_income = gets.chomp.to_f
when 'Horista'
  puts "Insira o número de horas trabalhadas:"
  teacher.work_hours = gets.chomp.to_f
  puts "Insira o valor da hora de trabalho:"
  teacher.hour_value = gets.chomp.to_f
when 'PJ'
  puts "Insira o valor do contrato:"
  teacher.contract_value = gets.chomp.to_f
else
  puts "Regime de pagamento inválido."
end

puts "Conforme o cálculo realizado, o teacher #{teacher.name} vai receber #{teacher.valor_a_receber}"
