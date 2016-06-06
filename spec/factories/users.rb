FactoryGirl.define do
  factory :user do
    factory :dougdo do
      username "dougdo"
      password_digest BCrypt::Password.create('abcdef')
    end
  end
end
