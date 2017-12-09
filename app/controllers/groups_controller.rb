class GroupsController < ApplicationController
  before_action :set_group, only: :edit

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
     redirect_to root_path, notice: "グループが作成されました"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
