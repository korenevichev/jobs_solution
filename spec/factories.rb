FactoryBot.define do

  factory :role do
    trait :admin do
      name { 'admin' }
    end
    trait :member do
      name { 'member' }
    end
  end

  factory :user do
    email { 'test_user@mail.com' }
    password { 'password' }
    trait :admin do
      role { create(:role, :admin) }
    end
    trait :member do
      role { create(:role, :member) }
    end
  end

  factory :job do
    title { 'Test Job' }
    salary_per_hour { 10 }
    languages { [create(:language)] }
    shifts { [create(:shift)] }
  end

  factory :language do
    name { 'English' }
  end

  factory :shift do
    from { DateTime.now }
    to { DateTime.now + 2.hours }
    period { from..to }
  end
end