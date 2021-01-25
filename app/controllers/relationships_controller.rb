# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :set_user, only: %i[create destroy]

  def create
    current_user.follow(@user)
    redirect_to @user, notice: 'ユーザーをフォローしました'
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to @user, notice: 'ユーザーのフォローを解除しました'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
