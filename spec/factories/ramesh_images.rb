# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ramesh_image do
    ramesh_image { fixture_file_upload(File.join(File.dirname(__FILE__), "files", "example.jpg"), "image/jpeg") }
    sequence(:image_datetime) { |i| Time.zone.now - i.day }
  end
end
