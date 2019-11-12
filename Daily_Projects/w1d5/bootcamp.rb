class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|hash, key| hash[key] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(str)
        @teachers << str
    end

    def enroll(str)
        if @students.length < @student_capacity 
            @students << str
            return true
        else
            return false
        end
    end

    def enrolled?(str)
        if @students.include?(str)
            return true
        else
            return false
        end
    end

    def student_to_teacher_ratio
        @students.length/@teachers.length
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student] << grade
            return true
        end
        false
    end

    def num_grades(student)
        return @grades[student].length if @grades.has_key?(student)
        return false
    end

    def average_grade(student)
        if @grades.has_key?(student) && !@grades[student].empty?
            sum = @grades[student].inject {|sum, grade| sum += grade}
            return sum/@grades[student].length
        end
        return nil
    end
end
