require 'typhoeus'

module Jobs
  class KeepAlive

    def perform(logger, url)
      logger.info("Sending request to '#{url}'")
      Typhoeus.get(url, followlocation: true)
    rescue => e
      logger.error("[#{url}] -> #{e.message}")
    end
  end
end
