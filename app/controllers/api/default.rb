module API
  module Default
    extend ActiveSupport::Concern

    included do
      include Helpers::Common
      
      version 'v1', using: :path

      content_type :json, 'application/json'
      content_type :txt, 'text/plain'
      # content_type :xml, 'application/xml'
      # content_type :binary, 'application/octet-stream'

      default_format :json

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!({code: 1, error: 'not fould'}, 404)
      end

      rescue_from NoMethodError do |e|
        error!({code: 1, error: 'system error'}, 422)
      end
      # rescue_from :all

    end
  end
end
