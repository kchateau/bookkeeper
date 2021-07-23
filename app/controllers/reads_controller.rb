class ReadsController < ApplicationController
  def create
    @read = Read.create(params)
    redirect_to root_path
  end
end
