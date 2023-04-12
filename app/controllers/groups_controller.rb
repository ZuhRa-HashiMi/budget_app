# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @groups = Group.includes([image_attachment: :blob]).where(user: @user).order('created_at DESC')
  end

  def new
    @groups = Group.new
    @user = current_user
  end

  def create
    @groups = Group.new(group_params)
    @groups.user = current_user
    if @groups.save
      flash[:notice] = 'Category added successfuly!'
      redirect_to user_groups_path
    else
      flash[:alert] = 'Category declined!'
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :image)
  end
end
