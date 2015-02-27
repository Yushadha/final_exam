FactoryGirl.define do
	factory :auction do
		title "penis"
		detail "vagina"
		ends_on DateTime.now
		reserve_price 10
	end
end