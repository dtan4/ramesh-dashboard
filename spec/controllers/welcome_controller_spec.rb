require 'rails_helper'

describe WelcomeController do
  describe "GET #index" do
    before do
      5.times { create(:ramesh_image) }
      get :index
    end

    it "should success" do
      expect(response).to be_success
    end

    it "shuold show list of images" do
      expect(assigns(:images).length).to eq 5
    end
  end
end
