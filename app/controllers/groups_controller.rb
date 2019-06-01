class GroupsController < ApplicationController

  def new
  end

  def create
    Group.create(group_params)
  end

  def edit
    grpup = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
  end

  private
  def group_params
    params.permit(:name)
  end
end
