class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:rememberable
  
  has_many :todos

  validates_presence_of :first_name, :last_name, :username, :email, :birth_date, :password, :message => "Não pode ficar em branco"
end