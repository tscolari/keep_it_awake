require 'spec_helper'

module Jobs
  describe KeepAlive do
    subject { KeepAlive.new }
    let(:logger) { Logger.new('/dev/null') }
    let(:url) { "http://www.google.com" }

    describe "#perform" do
      it "should send a request to the url" do
        request = stub_request(:get, url)
        subject.perform(logger, url)
        expect(request).to have_been_made.once
      end
    end
  end
end
