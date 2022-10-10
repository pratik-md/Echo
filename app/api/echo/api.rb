module Echo
  class API < Grape::API
    format :json

    mount Echo::Root

    add_swagger_documentation \
      mount_path: '/docs',
      info: { title: 'Echo' }
  end
end