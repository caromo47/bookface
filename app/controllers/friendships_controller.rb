class FriendshipsController < ApplicationController
	before_action :require_login
	def show
		@homies = Friendship.where(friend: User.find(current_user.id)).where(accepted: true)
		puts @users_invited_by
		@invitations = Friendship.where(friend: User.find(current_user.id)).where(accepted: false || nil)
		puts @invitations
	end

	def create
		Friendship.create(user: User.find(current_user.id), friend: User.find(params[:friend]))
			redirect_to :back
	end

	def update
		Friendship.find_by(user: User.find(params[:id]), friend: User.find(current_user)).update(accepted: true)
			redirect_to :back
	end

	def destroy
		Friendship.find_by(user: User.find(params[:friend]), friend: User.find(current_user)).delete
			redirect_to :back
	end
end
