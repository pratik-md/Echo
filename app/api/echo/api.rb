module Echo
  class API < Grape::API

    #adds support for JSON:API format
    content_type :json, 'application/vnd.api+json'
    default_format :json

    mount Echo::Root

    #sets error response for non-existing paths
    route :any, '*path' do
      error!({
        "errors": [
          {
            "code": "not_found",
            "detail": "Requested page '#{request.path}' does not exist"
          }
        ]        
      }, 404)
    end

    add_swagger_documentation \
      mount_path: '/docs',
      info: { title: 'Echo' }
      
  end
end