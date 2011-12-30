require 'font_assets/middleware'

module FontAssets
  class Railtie < Rails::Railtie
    config.font_assets = ActiveSupport::OrderedOptions.new

    initializer "font_assets.configure_rails_initialization" do |app|
      app.middleware.insert_before 'ActionDispatch::Static', FontAssets::Middleware
    end
    config.after_initialize do
      Rack::Mime::MIME_TYPES.merge!(
        '.woff' => 'application/x-font-woff',
        '.ttf'  => 'application/x-font-ttf',
        '.eot'  => 'application/vnd.ms-fontobject',
        '.svg'  => 'image/svg+xml'
      )
    end
  end
end
