require "bundler"
Bundler.require
Bundler.require :test

require 'minitest/autorun'

def fixture_path(file)
  File.expand_path("../fixtures/#{file}", __FILE__)
end
