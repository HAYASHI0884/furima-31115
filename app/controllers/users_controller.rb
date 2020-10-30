class UsersController < ApplicationController
  def edit

  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday)
  end
end