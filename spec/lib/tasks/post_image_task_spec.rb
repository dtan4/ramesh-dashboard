require "spec_helper"

pending Tasks::PostImageTask do
  describe "#execute" do
    let(:execute) do
      described_class.execute
    end

    let(:response_body) do
      open(File.expand_path(File.join("..", "..", "factories", "files", "example.jpg"), File.dirname(__FILE__))).read
    end

    before do
      %w(
      http://tokyo-ame.jwa.or.jp/map/map000.jpg
      http://tokyo-ame.jwa.or.jp/map/msk000.png
      http://tokyo-ame.jwa.or.jp/mesh/000/201407060000.gif
      ).each do |url|
        stub_request(:get, url).to_return(status: 200, body: response_body)
      end

      Timecop.freeze(Time.local(2014, 7, 6, 0, 5, 0))
    end

    it "should create new RameshImage" do
      expect do
        execute
      end.to change(RameshImage, :count).by(1)
    end

    it "should post image with YYYYmmddHHMM format" do
      execute
      expect(RameshImage.last.ramesh_image_url).to match /201407060000\.jpg\z/
    end

    after do
      Timecop.return
    end
  end
end
