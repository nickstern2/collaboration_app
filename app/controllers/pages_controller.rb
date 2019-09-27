class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @connections_array = []
    @users = User.all
  end


  def discover
    @users = User.all
    @connections_array
  end
end
