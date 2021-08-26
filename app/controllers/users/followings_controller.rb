# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @title = 'followings'
    @user  = User.find(params[:user_id])
    @users = @user.followings.order(:id).page(params[:page])
  end
end
