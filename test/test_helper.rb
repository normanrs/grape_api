require "bundler"
Bundler.require
Bundler.require :test

require 'minitest/autorun'

def fixture_path(file)
  File.expand_path("../fixtures/#{file}", __FILE__)
end

Sequel.postgres(host: 'localhost', user: 'normanrs', password: '', database: 'normanrs')

CarrierWave.configure do |config|
  config.root = File.expand_path "../../", __FILE__
  config.cache_dir = File.expand_path "../../public", __FILE__
end