FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Title #{n}" }
    description "Maybe brad pitt is in it?"
    director
  end

  factory :director do
    sequence(:name)  { |n| "Name #{n}" }
  end

  factory :hello, class: Director do
    name "Ilana"
  end

  factory :user, class: User do
    username "cornelius"
    password "123"
  end

end
