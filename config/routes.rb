Rails.application.routes.draw do
  mount Echo::API  => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
