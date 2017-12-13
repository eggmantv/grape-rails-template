GrapeSwaggerRails.options.tap do |o|
  o.app_name       = 'GrapeRailsTemplate'
  o.url            = '/api/doc/swagger'
  o.app_url        = ''
  o.api_auth       = 'basic'
  o.api_key_name   = 'Authorization'
  o.api_key_type   = 'header'
  o.hide_url_input = true
  o.before_filter do |request|
    unless Rails.env.development?
      authenticate_or_request_with_http_basic do |username, password|
        username == 'ab' && password == 'ac'
      end
    end
  end
end
