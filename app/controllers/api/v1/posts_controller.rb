module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all
        render json: {data:posts},status: :ok
      end
      def session_id
        render json: {data:session[:user_id]},status: :ok
      end
      def display
        posts = Post.where(category: params[:category]).order(created_at: :desc)
        postall = posts.map do |x|
          { :url => x.image.url, :name => x.user.name, :content => x.about,:created => x.created_at}
        end
        render json: {data:postall},status: :ok
      end
      def create
        post = Post.new
        post.about = params[:content]
        i = params[:image]
        data = i[i.index("base64,")+"base64,".size,i.size]
        pic = StringIO.new(Base64.decode64(data))
        pic.class_eval do
          attr_accessor :content_type, :original_filename
        end
        pic.content_type = "image/jpeg"
        pic.original_filename = "pic.jpeg"
        post.image = pic
        post.category = params[:category]
        post.user_id = session[:user_id]
        if post.save
          render json: {status:'Success',message:'Post Created',data:post},status: :ok
        else
          render json: {status:'Error',message:'Article not saved',data:post.errors},status: :unprocessable_entity
        end
      end
    end
  end
end
