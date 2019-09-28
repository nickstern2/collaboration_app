class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    @users = User.all
  end


  def discover
    @users = User.all
    # @like = Like.find(:params[:like_id])
  end
end
