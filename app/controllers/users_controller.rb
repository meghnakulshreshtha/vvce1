class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def show
  end

  def home
  end

end
