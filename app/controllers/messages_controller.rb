class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :update, :destroy, :edit]
  def index
    @message = Message.all.order("created_at DESC")


  end

  def new
    @message = Message.new
  end

  def show
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
        redirect_to root_path
      else
        render 'new'
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
        redirect_to message_path
      else
        render 'edit'
    end
  end

    def destroy
      #code
    end
  private
  def message_params
    params.require(:message).permit(:title,:description)
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
