class UserReadsController < ApplicationController
  def create
    @user_read = UserRead.create(params)
    redirect_to root_path
  end
end
