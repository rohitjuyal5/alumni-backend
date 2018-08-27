module Api
  module V1
    class SessionsController < ApplicationController
      def login
        user = User.find_by_email(params[:email])
        if user.password === params[:password]
          session[:user_id] = user.id
          render json: {status:"Success"},status: :ok
        else
          render json: {status:"Login failed"},status: :ok
        end
      end
      def destroy
        session[:user_id] = nil
        render json: {status:"Logged Out"},status: :ok
      end
    end
  end
end
