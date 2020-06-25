FactoryBot.define do
	
	factory :user do 
		sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
		password { "123456" }
	end
	
	factory :group_lesson do 
		nome { "test lezione" }
		descrizione { "descizione" }
		posti 30
		posti_disponibili 30
		inizio "2020-1-25"
		association :user

end
