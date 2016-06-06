FactoryGirl.define do
  factory :user do
    factory :doug do
      username "doug"
      password_digest BCrypt::Password.create('abcdef')
    end
  end
end
