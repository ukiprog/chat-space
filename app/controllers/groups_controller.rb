class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

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
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to root_path, notice: 'グループを編集しました'
  end

  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end
