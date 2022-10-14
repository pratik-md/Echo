GrapeSwaggerRails.options.url = '/docs.json'
GrapeSwaggerRails.options.app_name = 'Echo'
GrapeSwaggerRails.options.hide_api_key_input = true

GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end