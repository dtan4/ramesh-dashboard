require 'rails_helper'

describe RameshImagesController, :type => :controller do
  describe "GET show" do
    let(:show) { get :show, image_datetime: image_datetime }

    context "if image_datetime is YYYYmmdd" do
      let(:image_datetime) { "20140901" }

      before do
        origin = Time.new(2014, 9, 1, 0, 5, 0)

        [0, 5, 10].each do |minutes_ago|
          FactoryGirl.create(:ramesh_image, image_datetime: origin - minutes_ago.minutes)
        end
      end

      it "returns http success" do
        show
        expect(response).to be_success
      end

      it "render show_by_day template" do
        expect(show).to render_template :show_by_day
      end

      it "assigns images" do
        show
        images = assigns(:images)
        expect(images.length).to eq 2
      end
    end

    context "if image_datetime is YYYYmmddHHMM" do
      let(:image_datetime) { "2014090123" }

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

  describe "GET list" do
    let(:image_date)  { "20140901"}
    let(:list)        { get :list, image_date: image_date }
    let!(:image01)    { FactoryGirl.create(:ramesh_image, image_datetime: Time.new(2014, 9, 1, 0, 0)) }
    let!(:image02)    { FactoryGirl.create(:ramesh_image, image_datetime: Time.new(2014, 9, 1, 0, 5)) }

    it "should return JSON array" do
      list
      expect(response.body).to eq({
        error:           false,
        image_list: [
          { url: image01.ramesh_image.url, time: image01.image_datetime.strftime("%H:%M") },
          { url: image02.ramesh_image.url, time: image02.image_datetime.strftime("%H:%M") }
        ]
      }.to_json)
    end
  end
end
