#!/usr/bin/env ruby
require_relative '../keep_it_awake'

logger = Logger.new(STDOUT)
logger.level = Logger::INFO
KeepItAwake.new(logger).run
