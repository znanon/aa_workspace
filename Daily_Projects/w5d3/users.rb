require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('users.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users
  attr_accessor :id, :fname, :lname
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(input_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, input_id)
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    puts "#{data}"
    return nil unless data.length > 0
    
    Users.new(data.first)
  end

  def self.find_by_name(input_fname, input_lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, input_fname, input_lname)
      SELECT *
      FROM users
      WHERE fname = ?, lname = ?
    SQL
    return nil unless data.length > 0
    Users.new(data)
  end

  def followed_questions
    QuestionFollow.followers_questions_for_user_id(id)
  end
end

class QuestionFollow
  attr_accessor :id, :questions_id, :user_id
  def initialize(options)
    @id = options['id']
    @questions_id = options['questions_id']
    @user_id = options['user_id']
  end

  def self.followers_questions_for_user_id(in_user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, in_user_id)
      SELECT questions.*
      FROM questions
      JOIN users ON user_id = users.id
      WHERE users.id = ? 
    SQL
    data.map { |datum| Questions.new(datum) }
  end

  def self.followers_for_question_id(in_question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, in_question_id)
      SELECT users.*
      FROM questions
      JOIN users ON user_id = users.id
      WHERE questions.id = ? 
    SQL
    Users.new(data.first)
  end
end

class Questions
  attr_accessor :id, :title, :body, :user_id
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def self.find_by_id(input_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, input_id)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    return nil unless data.length > 0
    Questions.new(data.first)
  end

  def followers
    QuestionFollow.followers_for_question_id(id)
  end
end

class Replies
  attr_accessor :id, :reply_id, :question_id, :user_id, :body
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @reply_id = options['reply_id']
    @body = options['body']
  end

  def self.find_by_id(input_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, input_id)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    return nil unless data.length > 0
    Replies.new(data.first)
  end
end

class QuestionLikes
  attr_accessor :id, :liked, :question_id, :user_id
  def initialize(options)
    @id = options['id']
    @liked = options['liked']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.find_by_id(input_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, input_id)
      SELECT *
      FROM question_likes
      WHERE id = ?
    SQL
    return nil unless data.length > 0
    QuestionLikes.new(data.first)
  end
end