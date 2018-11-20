class SubsController < ApplicationController
  before_action :require_log_in!
  
  def new
    @sub = Sub.new
  end
  
  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id
    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end
  
  def index
    @subs = Sub.all
  end
  
  def show
    @sub = Sub.find(params[:id])
  end
  
  def edit
    @sub = Sub.find(params[:id])
  end
  
  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit  
    end
  end
  
  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
    
end
