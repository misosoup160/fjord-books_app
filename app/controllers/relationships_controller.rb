# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:follow_id])
    current_user.follow(@user)
    flash[:notice] = 'ユーザーをフォローしました'
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:follow_id])
    current_user.unfollow(@user)
    flash[:notice] = 'ユーザーのフォローを解除しました'
    redirect_to @user
  end
end
