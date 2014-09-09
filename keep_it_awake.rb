require 'rubygems'
require 'bundler/setup'

require_relative './jobs/keep_alive'

class KeepItAwake
  def initialize(logger = Logger.new(STDOUT))
    @logger = logger
  end

  def run
    watched_urls.map do |url|
      Thread.new do
        Jobs::KeepAlive.new.perform(@logger, url)
      end
    end.each(&:join)
  end

  private

  def watched_urls
    @watched_urls ||= ENV['WATCHED_URLS'].to_s.split(',')
  end
end
