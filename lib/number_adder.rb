class NumberAdder

  attr_accessor :number1, :number2

  def initialize(number1, number2)
    @number1 = number1
    @number2 = number2
  end

  def add
    @number1 + @number2
  end

end
