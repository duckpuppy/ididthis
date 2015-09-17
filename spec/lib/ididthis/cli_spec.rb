require "spec_helper"

describe Ididthis::CLI do
  let(:client) { instance_double "Ididthis::API::Client" }

  describe "#post" do
    before(:each) do
      allow(Ididthis::API::Client).to receive(:new) { client }
    end

    it "consumes args from first unknown to end as done" do
      expect(client).to receive(:post_done) do |arg|
        expect(arg).to eq("foo bar baz")
      end

      args = ["post", "--date", "01-01-15", "foo", "bar", "baz"]
      described_class.start(args)
    end
  end
end
