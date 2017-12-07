class UsersController < ApplicationController

  def edit
  end

  def update
    current_user.update(account_params)
    redirect_to controller: :messages, action: :index
  end

private

  def account_params
    params.permit(:name, :email)
  end

end
