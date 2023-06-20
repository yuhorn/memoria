FactoryBot.define do
  factory :photo do
    memo  {'test'}
    date  {'2023-06-20'}
    image {Rack::Test::UploadedFile.new("public/images/test_image.png", "image/png")}
    association :user
    association :album
  end
end