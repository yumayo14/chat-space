FactoryGirl.define do
  factory :message do
    text      Faker::Lorem.sentence
    image     Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/fixtures/JPEG_example_JPG_RIP_050.jpg'))
    group
    user

  end

end
