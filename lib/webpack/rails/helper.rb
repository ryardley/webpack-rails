require 'action_view'
require 'webpack/rails/manifest'

module Webpack
  module Rails
    module Helper
      include ActionView::Helpers::AssetUrlHelper

      def webpack_asset_path source, options={}
        source = source.to_s
        return "" unless source.present?

        path = Webpack::Rails::Manifest.asset_path(source)

        if ::Rails.configuration.webpack.dev_server.enabled
          path = "http://#{request.host}:#{::Rails.configuration.webpack.dev_server.port}#{path}"
        end

        path
      end
    end
  end
end
