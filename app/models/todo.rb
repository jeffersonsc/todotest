class Todo < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description, message: "Este campo não pode ficar em branco."

  default_scope{order("priority")}

  before_save :check_todo
  before_create :set_priority


  def check_todo
  	if self.finalized
  		date = Time.now
  	else
  		date = ''
  	end
  	self.due_date = date
  end

  def set_priority
  	self.priority = user.todos.count
  end

  def alter_priority(value, user_id)
  	if value < self.priority
      User.find(user_id).todos.where('priority >= ?', value).each_with_index{|t,i| t.update(priority: i + value + 1)}
    else
      User.find(user_id).todos.relatives.where('priority <= ?', value).each_with_index{|t,i| t.update(priority: i)}
    end

    self.update priority: value
  end
end
