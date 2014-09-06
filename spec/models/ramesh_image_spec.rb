require 'rails_helper'

describe RameshImage do
  it "shuold validate presence of ramesh_image" do
    expect(subject).to validate_presence_of :ramesh_image
  end

  it "shuold validate presence of image_datetime" do
    expect(subject).to validate_presence_of :image_datetime
  end

  it "shuold validate uniqueness of image_datetime" do
    create(:ramesh_image)
    expect(subject).to validate_uniqueness_of :image_datetime
  end

  describe "#next_image" do
    let(:image) { FactoryGirl.create(:ramesh_image, image_datetime: Time.new(2014, 9, 1, 23, 0, 0)) }

    context "if next image exists" do
      before do
        FactoryGirl.create(:ramesh_image, image_datetime: image.image_datetime + 5.minutes)
      end

      it "should return next image" do
        expect(image.next_image).to be_a RameshImage
        expect(image.next_image.image_datetime).to eq image.image_datetime + 5.minutes
      end
    end

    context "if next image does not exist" do
      it "should return nil" do
        expect(image.next_image).to be_nil
      end
    end
  end

  describe "#previous_image" do
    let(:image) { FactoryGirl.create(:ramesh_image, image_datetime: Time.new(2014, 9, 1, 23, 0, 0)) }

    context "if next image exists" do
      before do
        FactoryGirl.create(:ramesh_image, image_datetime: image.image_datetime - 5.minutes)
      end

      it "should return next image" do
        expect(image.previous_image).to be_a RameshImage
        expect(image.previous_image.image_datetime).to eq image.image_datetime - 5.minutes
      end
    end

    context "if next image does not exist" do
      it "should return nil" do
        expect(image.previous_image).to be_nil
      end
    end
  end

  describe "#strftime" do
    let(:image) { FactoryGirl.create(:ramesh_image, image_datetime: Time.new(2014, 9, 1, 23, 0, 0)) }

    it "should return formatted datetime" do
      expect(image.strftime("%Y-%m-%d %H:%M")).to eq "2014-09-01 23:00"
    end
  end
end
