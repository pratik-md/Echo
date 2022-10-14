module Echo::V1::Entities
  class MockEndpoint < Grape::Entity
    expose :data do
      expose :type
      expose :id,                     documentation: { desc: "ID of the mock endpoint"}
      expose :attributes do
        expose :verb,                 documentation: { desc: "HTTP method of the endpoint"}
        expose :path,                 documentation: { desc: "URL path of endpoint"}
        expose :response,             documentation: { desc: "An object that contains status code, http headers and response body of the endpoint"}
      end
    end

    private
    
    def id
      object.id.to_s
    end
  end
end