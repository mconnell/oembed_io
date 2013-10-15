require_relative '../lib/oembed_io'

describe OEmbed do
  let(:test_string){ 'http://www.youtube.com/watch?v=5zey8567bcg' }
  subject { OEmbed.new(test_string) }

  describe "#uri" do
    context "valid http uri" do
      let(:test_string){ 'http://www.youtube.com/watch?v=5zey8567bcg' }

      it "returns a URI::HTTP object" do
        subject.uri.class.should == URI::HTTP
      end

      it "generates a new oEmbed.io uri for a given string" do
        subject.uri.to_s.should == "http://oembed.io/api?url=http://www.youtube.com/watch?v=5zey8567bcg"
      end
    end

    context "invalid uri" do
      let(:test_string){ 'poop' }

      it "still generates a new oEmbed.io uri for a given string" do
        subject.uri.to_s.should == "http://oembed.io/api?url=poop"
      end
    end
  end

  describe "valid?" do
    context "string that isn't a uri" do
      let(:test_string) { 'rubbish text' }

      it "returns false" do
        subject.valid?.should be_false
      end
    end

    context "string that looks like a uri" do
      let(:test_string) { 'http://neo.com' }

      it "returns true" do
        subject.valid?.should be_true
      end
    end
  end

end
