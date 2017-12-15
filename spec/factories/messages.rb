FactoryGirl.define do
  factory :message do
    text      "吉岡です"
    image     Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/fixtures/JPEG_example_JPG_RIP_050.jpg'))
    user
    group

  end

end
