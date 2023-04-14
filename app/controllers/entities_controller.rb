class EntitiesController < ApplicationController
  def index
    @user = current_user
    @groups = Group.find(params[:group_id])
    @entity = @groups.entities.order('created_at DESC')
  end

  def new
    @user = current_user
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    @entity.groups << Group.find(params[:group_id])
    if @entity.save
      flash[:notice] = 'Transaction added successfuly!'
      redirect_to user_group_entities_path
    else
      flash[:alert] = 'Transaction declined!'
      render 'new'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
