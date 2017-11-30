class UsersController < ApplicationController
	before_action :require_login, except: [:create]

	def index
		@users = User.where.not(id: User.find(current_user).friends).where.not(id: User.find(current_user))
	end

	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			session[:user_id] = @user.id
			redirect_to '/professional_profile'
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@user = User.find(params[:user_id])
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
		end
end
