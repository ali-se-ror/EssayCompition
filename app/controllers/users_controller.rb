class UsersController < ApplicationController

  def index
    @essays = current_user.essays
  end

end
