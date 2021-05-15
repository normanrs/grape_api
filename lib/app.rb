require 'asset_uploader'

module API
  DB = Sequel.postgres(host: 'localhost', user: 'normanrs', password: '', database: 'normanrs')

  class APP < Grape::API
    format      :json
    rescue_from :all

    resource :files do
      post do 
        uploader = AssetUploader.new
        uploader.store!(params[:file][:file][:tempfile])
        table = DB[:assets]
        asset_hash = {
          title: params.dig(:file, :title),
          file: params.dig(:file, :file).to_s
        }
        table.insert(asset_hash)
        asset_hash
      end
    end
  end
end