Rails.application.routes.draw do

  mount API::Base, at: '/api'
  mount GrapeSwaggerRails::Engine => '/api/doc'

end
