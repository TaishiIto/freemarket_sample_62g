FactoryBot.define do
  factory :item do
    images               { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'spec/factories/test.jpg') ] } 
    name                 {"duck"}
    description          {"quckquck"}
    price                {"300"}
    condition            {"1"}
    brand                {"test"}
    size_id              {"1"}
    category_id          {"1"}
  end
end
