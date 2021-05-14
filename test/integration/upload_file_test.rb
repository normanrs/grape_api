require_relative '../test_helper'
require 'app.rb'

include Rack::Test::Methods

class TheprogramTest <  Minitest::Test
  def test_file_upload
    file_path = fixture_path('test.zip')
    response = post "/files", {
      file: {
        title: 'My first zip file',
        file: Rack::Test::UploadedFile.new(file_path, "application/zip", true)
      }
    }
    assert_equal 201, response.status
  end

  private

  def app
    API::APP
  end

end