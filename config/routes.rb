Rails.application.routes.draw do

  mount API::Blogs, at: '/api'

end
