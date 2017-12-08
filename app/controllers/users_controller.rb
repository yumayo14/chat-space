class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(account_params)
      redirect_to root_path, notice: :"ユーザー情報の更新に成功しました"
    else
      render :edit, alert: :"ユーザー情報の更新に失敗しました"
    end
  end

  private

  def account_params
    params.permit(:name, :email)
  end

end
