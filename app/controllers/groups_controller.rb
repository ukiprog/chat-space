class GroupsController < ApplicationController

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to root_path, notice: 'グループを作成しました'
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
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end
