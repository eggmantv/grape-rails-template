module API
  module V1
    class Blogs < Grape::API
      include Default

      # http_basic do |username, password|
      #   username == 'test' and password == 'hello'
      # end

      # before do
      #   unless request.headers['X-Api-Secret-Key'] == 'api_secret_key'
      #     # error! :forbidden, 403
      #     error!({code: 1, message: 'forbidden'}, 403)
      #   end
      # end

      after do
      end

      before_validation do
      end

      after_validation do
      end

      get '/test/filter' do
        raise NoMethodError
      end

      # 别名: namespace, resource, group, segment
      resources :blogs do

        before do
        end

        # /blogs/3/comments
        route_param :id do
          resources :comments do
            get do
              build_response(data: "blog #{params[:id]} comments")
            end
          end
        end

        get do
          build_response(data: {blogs: []})
        end

        desc "获得博客详情"
        params do
          use :id_validator
        end
        get ':id', requirements: { id: /\d+/ } do
          build_response(data: "id #{params[:id]}")
        end

        desc "create a blog"
        params do
          requires :title, type: String, desc: "博客标题"
          requires :content, type: String, desc: "博客内容", as: :body

          optional :tags, type: Array, desc: "博客标签", allow_blank: false
          optional :state, type: Symbol, default: :pending, values: [:pending, :done]
          optional :meta_name, type: { value: String, message: "meta_name比必须为字符串" },
            regexp: /^s\-/

          optional :cover, type: File
          given :cover do
            requires :weight, type: Integer, values: { value: ->(v) { v >= -1 }, message: "weight必须大于等于-1" }
          end

          optional :comments, type: Array do
            requires :content, type: String, allow_blank: false
          end

          optional :category, type: Hash do
            requires :id, type: Integer
          end
        end
        post do
          build_response(data: params)
        end

        desc "博客修改"
        params do
          use :id_validator
        end
        put ':id' do
          build_response(data: "put #{params[:id]}")
        end

        desc "博客删除"
        params do
          use :id_validator
        end
        delete ':id' do
          build_response(data: "delete #{params[:id]}")
        end

        # /blogs/hot
        # /blogs/hot/pop
        # /blogs/hot/pop/3
        get 'hot(/pop(/:id))' do
          build_response(data: "hot #{params[:id]}")
        end

        get 'latest', hidden: true do
          redirect '/api/blogs/popular'
        end

        get 'popular' do
          status 400
          build_response(data: 'popular')
        end
      end


    end
  end
end
