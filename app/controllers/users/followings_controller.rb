# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  # def index
  #   @user = User.find(params[:user_id])
  #   @followers = @user.followers.order(:id).page(params[:page])
  # end
  def index
    @title = 'followings'
    @user  = User.find(params[:user_id])
    @users = @user.followings.order(:id).page(params[:page])
    # render '/show_follow'
    # redirect_to user_followings_path
  end
end
