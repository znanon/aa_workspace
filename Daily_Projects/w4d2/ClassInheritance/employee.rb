class Employee
  def initialize(name, title,salary,boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
  protected
  attr_accessor :name, :title, :salary, :boss
end

new_hire = Employee.new("John", "server", 43, "Doe")
p new_hire
p new_hire.bonus(2)