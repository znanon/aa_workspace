require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(start_up)
        @funding > start_up.funding 
    end 

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        pay = @salaries[employee.title]
        if @funding > pay
            employee.pay(pay)
            @funding -= pay
        else
            raise
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end  
    end
    
    def average_salary
        average = 0
        @employees.each do |employee|
           average += @salaries[employee.title]
        end
        average / @employees.length 
    end

    def close
        @employees = []
        @funding = 0 
    end 

    def acquire(start_up)
        @funding += start_up.funding
        @salaries.merge(start_up.salaries)
        @employees.push(*start_up.employees)
        start_up.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        start_up.close
    end 
end
