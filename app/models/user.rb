class User < ActiveRecord::Base
  has_many :todos

  validates_presence_of :first_name, :last_name, :username, :email, :birth_date, :message => "Não pode ficar em branco"
  validates_uniqueness_of :username, :message => "Usuário já existente", :if => :username_changed?
  validates_uniqueness_of :email, :message => "Usuário já existente", :if => :email_changed?
end