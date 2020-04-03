# frozen_string_literal: true

class UsersController < ApiController
  # before_action :set_user, only: %i[get_current_user]
  skip_before_action :auth_user, only: %i[create]

  def get_current_user
    render json: Current.user, serializer: UserSerializer
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    @user_params ||= params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user_params
  end
end
