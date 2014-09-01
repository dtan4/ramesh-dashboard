require 'rails_helper'

describe RameshImagesController, :type => :controller do
  describe "GET show" do
    let(:image_datetime) { "201409012300" }
    let(:show)           { get :show, image_datetime: image_datetime }

    before do
      FactoryGirl.create(:ramesh_image, image_datetime: Time.parse(image_datetime))
    end

    it "returns http success" do
      show
      expect(response).to be_success
    end

    it "assigns specified image" do
      show
      image = assigns(:image)
      expect(image).to be_a RameshImage
      expect(image.image_datetime).to eq Time.parse(image_datetime)
    end
  end
end
