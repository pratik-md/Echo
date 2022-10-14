module Echo::V1
  class Endpoints < Grape::API
    version 'v1', using: :path
    
    resource :endpoints do
      desc 'Creates a mock endpoint'
      params do
        requires :data, type: Hash do
          optional :type, type: String
          requires :attributes, type: Hash do
            requires :verb, type: String, desc: 'A string value that may take one of the HTTP method names'
            requires :path, type: String, desc: 'A string value of the path part of URL'
            requires :response, type: Hash do
              requires :code,    type: Integer, desc: 'An integer status code returned by Endpoint'
              optional :headers, type: Hash,    desc: 'A key-value structure where keys represent HTTP header names and values hold actual values of these headers returned by Endpoint'
              optional :body,    type: String,  desc: 'A string representation of response body returned by Endpoint'
            end
          end
        end
      end
      post do
        mock_endpoint = MockEndpoint.create!(params.dig(:data, :attributes).merge!(type: params.dig(:data, :type)))
        header 'Location', request.base_url + '/v1' + mock_endpoint.path
        present mock_endpoint, with: Entities::MockEndpoint
      end

      desc 'Returns a list of available mock endpoints'
      get do
        present MockEndpoint.all, with: Entities::MockEndpoint
      end

      desc 'Updates the specified mock endpoint'
      params do
        requires :data, type: Hash do
          optional :type, type: String
          requires :id,   type: String, desc: 'A string value that uniquely identifies an Endpoint'
          requires :attributes, type: Hash do
            requires :verb, type: String, desc: 'A string value that may take one of the HTTP method names'
            requires :path, type: String, desc: 'A string value of the path part of URL'
            requires :response, type: Hash do
              requires :code,    type: Integer, desc: 'An integer status code returned by Endpoint'
              optional :headers, type: Hash,    desc: 'A key-value structure where keys represent HTTP header names and values hold actual values of these headers returned by Endpoint'
              optional :body,    type: String,  desc: 'A string representation of response body returned by Endpoint'
            end
          end
        end
      end
      patch '/:id' do
        error!("Mock endpoint ID in request URL does not match ID in request data.", 404) unless params[:id].eql?(params.dig(:data, :id))
        mock_endpoint = MockEndpoint.find(params[:id])
        mock_endpoint.update!(params.dig(:data, :attributes).merge!(type: params.dig(:data, :type)))
        present mock_endpoint, with: Entities::MockEndpoint
      end

      desc 'Deletes the specified mock endpoint'
      delete '/:id' do
        MockEndpoint.find(params[:id]).destroy!
        body false
      end
    end
  end
end