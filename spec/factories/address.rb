FactoryBot.define do
  factory :address do
    zip_code               {"1234567"}
    city                   {"渋谷区"}
    house_number           {"渋谷1-1-1"}
    prefecture_id          {"1"}
    user_id                {"1"}
  end
end
