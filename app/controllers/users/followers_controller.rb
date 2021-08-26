# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @title = 'followers'
    @user  = User.find(params[:user_id])
    @users = @user.followers.order(:id).page(params[:page])
  end
end
