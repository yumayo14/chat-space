class UsersController < ApplicationController
end

  def edit
  end

  def update
    current_user.update(account_params)
    if user_signed_in?
  end

private

  def account_params
    params.permit(:name, :email)
  end

end
