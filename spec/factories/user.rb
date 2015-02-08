FactoryGirl.define do
	factory :user do
		#after(:build) { |user| create(:post, user: :user) }
		name "Douglas Adams"
		sequence(:email, 100) { |n| "person#{n}@example.com" }
		password "helloworld"
		password_confirmation "helloworld"
		confirmed_at Time.now

		#factory :user_with_post_and_comment do


	end
end
