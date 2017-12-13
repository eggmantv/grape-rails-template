module API
  module Helpers
    module Common
      extend ActiveSupport::Concern

      included do
        helpers do
          def build_response code: 0, data: nil
            { code: code, data: data }
          end

          params :id_validator do
            requires :id, type: Integer
          end
        end
      end

    end
  end
end
