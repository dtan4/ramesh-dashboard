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
    let(:list)     { get :list, image_date: image_date }
    let!(:image01) { FactoryGirl.create(:ramesh_image, image_datetime: Time.new(2014, 9, 1, 0, 0)) }
    let!(:image02) { FactoryGirl.create(:ramesh_image, image_datetime: Time.new(2014, 9, 1, 0, 5)) }

    context "when valid parameter is given" do
      let(:image_date)  { "20140901" }

      it "should return error:false and image_list" do
        list
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:error]).to be false
        expect(json[:image_list]).to eql [
          { url: image01.ramesh_image.url, time: image01.strftime("%H:%M") },
          { url: image02.ramesh_image.url, time: image02.strftime("%H:%M") }
        ]
      end
    end

    context "when invalid parameter is given" do
      let(:image_date)  { "hoge" }

      it "should return error:true" do
        list
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:error]).to be true
      end
    end
  end
end
