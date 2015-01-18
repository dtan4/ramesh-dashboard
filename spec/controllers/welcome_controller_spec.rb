require 'rails_helper'

describe WelcomeController do
  describe "GET #index" do
    let(:index) { get :index }

    before do
      FactoryGirl.create(:ramesh_image, image_datetime: Time.zone.local(2014, 9, 1, 10, 0))
      FactoryGirl.create(:ramesh_image, image_datetime: Time.zone.local(2014, 9, 1, 9, 0))
      FactoryGirl.create(:ramesh_image, image_datetime: Time.zone.local(2014, 9, 1, 7, 0))

      Timecop.freeze(Time.zone.local(2014, 9, 1, 10, 15))
    end

    it "should success" do
      index
      expect(response).to be_success
    end

    it "shuold show list of images in the last 2 hours" do
      index
      expect(assigns(:images).length).to eq 2
    end

    it "should assign image_datetimes" do
      index
      expect(assigns(:image_datetimes)).to eql ["2014-09-01"]
    end

    after do
      Timecop.return
    end
  end
end
