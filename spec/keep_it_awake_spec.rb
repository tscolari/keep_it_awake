require 'spec_helper'

describe KeepItAwake do
  subject { KeepItAwake.new(Logger.new('/dev/null')) }

  describe "#run" do
    let(:urls) { "http://1,http://2,http://3"}

    before do
      ENV['WATCHED_URLS'] = urls
    end

    it "should have 'pinged' each of the urls" do
      requests = []
      urls.split(',').each do |url|
        requests << stub_request(:get, url)
      end

      subject.run

      requests.each do |request|
        expect(request).to have_been_made.once
      end
    end
  end
end
