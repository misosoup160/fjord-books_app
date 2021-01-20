# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings.order(:id).page(params[:page])
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.order(:id).page(params[:page])
    render 'show_follower'
  end
end
