class Bootcamp
    attr_reader :name, :slogan, :teachers, :students
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @students = []
        @teachers = []
        @grades = Hash.new {|hash, key| hash[key] = []}
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.size >= @student_capacity
            false
        else
            @students << student
            true
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        (@students.size/@teachers.size.to_f).floor
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            true
        else
            false
        end
    end

    def num_grades(student)
        @grades[student].size
    end

    def average_grade(student)
        if !enrolled?(student) || @grades[student].empty?
            nil
        else
            (@grades[student].sum/@grades[student].size.to_f).floor
        end
    end
end