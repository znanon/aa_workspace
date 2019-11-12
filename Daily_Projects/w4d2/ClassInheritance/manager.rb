require_relative "employee"

class Manager < Employee
  def initialize(name, title,salary,boss)
    super(name, title,salary,boss)
    # super(name, title, salary, boss)
    @workers = []
  end

  def bonus(multi)
    total = 0
    workers.each do |employee|
      if employee.workers != nil && employee.workers.length > 0
        total += employee.bonus(1)
      end
      total += employee.salary
    end
    return total * multi
  end

  def add_worker(w)
    workers << w
  end
  protected
  attr_accessor :workers
end


new_manager = Manager.new('A', "Server", 10, "idk")
f_manager = Manager.new('B1', "Server", 10, "idk")
f2_manager = Manager.new('B2', "Server", 5, "idk")
f_1_manager = Manager.new('Bob', "Server", 2, "idk")
f_2_manager = Manager.new('Bob', "Server", 2, "idk")
# f_manager.add_worker(f_1_manager)
# f2_manager.add_worker(f_2_manager)
# new_manager.add_worker(f_manager)
# new_manager.add_worker(f2_manager)
p new_manager.workers
