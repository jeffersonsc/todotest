class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :todos

  validates_presence_of :first_name, :last_name, :username, :email, :birth_date, :message => "Não pode ficar em branco"
  validates_uniqueness_of :username, :message => "Usuário já existente", :if => :username_changed?
  validates_uniqueness_of :email, :message => "Usuário já existente", :if => :email_changed?
end