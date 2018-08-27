module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.order('created_at DESC')
        render  json: {status: 'Success',message: 'All users',data:users},status: :ok
      end
      def alum
        users = User.where(alumornot: true)
        render json: {data:users},status: :ok
      end
      def student
        users = User.where(alumornot: false)
        render json: {data:users},status: :ok
      end
      def create
        user = User.new
        user.name = params[:name]
        user.email = params[:email]
        user.password = params[:password]
        user.phoneno = params[:phoneno]
        bach = []
        bach<<params[:batchStart]
        bach<<params[:batchEnd]
        batch = bach.join('-')
        user.batch = batch
        t = Time.now
        year = params[:batchend].to_i
        if year < t.year
          user.alumornot = 1
        else
          user.alumornot = 0
        end
        if user.save
          render json: {status:'Success',message:'User Created',data:user},status: :ok
        else
          render json: {status:'Error',message:'Article not saved',data:user.errors},status: :unprocessable_entity
        end
      end
      # def login
      #   user = User.find_by_email(params[:email])
      #   if user.password === params[:password]
      #     render json: {status:"Success"},status: :ok
      #   else
      #     render json: {status:"Login failed"},status: :ok
      #   end
      # end
    end
  end
end
