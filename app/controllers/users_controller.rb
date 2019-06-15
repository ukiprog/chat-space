class UsersController < ApplicationController

  def edit 
  end

  def update
    current_user.update(user_params)
  end

  def index
    @users = User.where('name like ?', "#{params[:keyword]}%" ).where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def user_params
    params['user'].permit(:name, :email)
  end

end
