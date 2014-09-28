class UsersController < ApplicationController

	def index
		users = User.all
		render json: users
	end

	def current
		render json: current_user
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			return user
			redirect_to "/users/#{user.id}"
		end
	end

	def show
		user = [User.find(params[:id])]
		render json: user
	end

	private
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end