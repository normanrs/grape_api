require_relative '../test_helper'
require 'app.rb'
require 'json'

include Rack::Test::Methods

class UploadFileTest <  Minitest::Test

  def setup
    @file_path = fixture_path('test.zip')
    @title = 'My first zip file'
    @response = post "/files", {
      file: {
        title: @title,
        file: Rack::Test::UploadedFile.new(@file_path, "application/zip", true)
      }
    }
  end

  def test_file_upload
    assert_equal 201, @response.status
    assert_equal @title, JSON.parse(@response.body)['title']
    puts @response.body
  end

  private

  def app
    API::APP
  end

end