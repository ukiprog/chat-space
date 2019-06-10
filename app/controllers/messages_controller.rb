class MessagesController < ApplicationController
  before_action :get_group

  def index
    set_index()
    @message = Message.new
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group) }
        format.json
      end
    else
      set_index()
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def get_group
    @group = Group.find(params[:group_id])
  end

  def set_index
    @groups = current_user.groups
    @messages = @group.messages.includes(:user)

    temp = []
    @group.users.each do |u|
      temp << u.name
    end
    @members = temp.join(' ')
  end
end
