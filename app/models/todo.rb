class Todo < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description, message: "Este campo não pode ficar em branco."

  default_scope{order("priority")}
end
