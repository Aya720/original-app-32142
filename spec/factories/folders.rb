FactoryBot.define do
  factory :folder do
    name                   { 'aaa' }
    after(:build) do |folder|
      folder.image.attach(io: File.open('public/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
