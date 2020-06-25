FactoryBot.define do
	
	factory :user do 
	
		sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
		password { "123456" }
	
		factory :trainer do 
			trainer_role { true }
			user_role { false }
		end
	end

end
