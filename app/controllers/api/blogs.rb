module API
  class Blogs < Grape::API

    default_format :json

    get '/' do
      'blogs/index'
    end

  end

end
