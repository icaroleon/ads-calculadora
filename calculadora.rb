class Teacher
  attr_accessor :name, :contract_type, :mensal_income, :work_hours, :hour_value, :contract_value

  def initialize(name, contract_type)
    @name = name
    @contract_type = contract_type
  end

  def income
    case @contract_type.downcase
    when 'clt'
      @mensal_income
    when 'horista'
      @work_hours * @hour_value
    when 'pj'
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
contract_type_downcase = contract_type.downcase

unless ['clt', 'horista', 'pj'].include?(contract_type_downcase)
  puts "Regime de pagamento inválido. Favor reinserir as informações."
  return
end

teacher = Teacher.new(name, contract_type_downcase)

case contract_type_downcase
when 'clt'
  puts "Insira o salário mensal:"
  teacher.mensal_income = gets.chomp.to_f
when 'horista'
  puts "Insira o número de horas trabalhadas:"
  teacher.work_hours = gets.chomp.to_f
  puts "Insira o valor da hora de trabalho:"
  teacher.hour_value = gets.chomp.to_f
when 'pj'
  puts "Insira o valor do contrato:"
  teacher.contract_value = gets.chomp.to_f
else
  puts "Regime de pagamento inválido."
end

puts "Conforme o cálculo realizado, o professor #{teacher.name}, que presta serviço na modalidade #{contract_type}, vai receber R$#{teacher.income}."
