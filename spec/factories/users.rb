FactoryBot.define do
  factory :user do
    name                    {"田中たなか"}
    email                   {"test@gmail.com"}
    first_name_kanji        {"田中"}
    family_name_kanji       {"太郎"}
    first_name_kana         {"タナカ"}
    family_name_kana        {"タロウ"}
    birthday                {"1993-01-01"}
    phone_number            {"09012345678"}
    password                {"asdfghj"}
  end
end
