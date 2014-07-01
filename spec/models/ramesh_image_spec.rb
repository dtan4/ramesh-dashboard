require 'rails_helper'

describe RameshImage do
  it "shuold validate presence of ramesh_image" do
    expect(subject).to validate_presence_of :ramesh_image
  end

  it "shuold validate presence of image_datetime" do
    expect(subject).to validate_presence_of :image_datetime
  end

  it "shuold validate uniqueness of image_datetime" do
    expect(subject).to validate_uniqueness_of :image_datetime
  end
end
