Rails.application.routes.draw do

  mount API::Blogs, at: '/api'
  mount GrapeSwaggerRails::Engine => '/api/doc'

end
