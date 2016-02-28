FactoryGirl.define do

	sequence :username do |n|
  	"username_#{n}"
	end

  factory :user do
    first_name "Jefferson"
    last_name "Cunha"
    email "jefferson@gmail.com"
    username
    birth_date 22.years.ago
    admin true
    password "12345678"
    password_confirmation { |u| u.password }
  end
    


end
