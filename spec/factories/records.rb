FactoryBot.define do
  factory :record do
    title { 'aaaaaa' }
    caption { 'aaaaaa' }
    after(:build) do |record|
      record.image.attach(io: File.open('public/sample.jpg'), filename: 'sample.jpg')
    end
    association :folder
  end
end
