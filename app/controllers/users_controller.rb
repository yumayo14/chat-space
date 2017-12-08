class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(account_params)
      redirect_to controller: :messages, action: :index
    else
      render :edit
    end
  end

  private

  def account_params
    params.permit(:name, :email)
  end

end
