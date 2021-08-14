# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  # def create
  #   user = User.create!(user_params)
  #   redirect_to root_path
  # end

  # def update
  #   if @user.update(user_params) && @user.avatar.attach(params[:avatar])
  #     redirect_to user_path(@user)
  #   else
  #     render :edit
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:name, :postal_code, :address, :self_introduction, :avatar)
  end
end
