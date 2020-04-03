# frozen_string_literal: true

class AuthenticationController < ApiController
  skip_before_action :auth_user
  before_action :init_current_user

  def authenticate
    Rails.logger.ap 'safe_params[:email]': safe_params[:email], 'safe_params[:password]': safe_params[:password]
    command = ::AuthenticateUser.call(safe_params[:email], safe_params[:password])
    user_exists = User.find_by(email: safe_params[:email])
    if command.success?
      render status: :ok, json: {
        auth_token: command.result,
        email: Current.user.email,
        new: !user_exists,
        provider: :email,
        user_id: Current.user.id,
      }
    else
      render status: :bad_request, json: { error: command.errors }
    end
  end

  private

  def init_current_user
    Current.user = User.find_by(email: current_user_params[:email])
  end

  def current_user_params
    @current_user_params ||= {
      email: safe_params[:email],
      id: safe_params[:id],
    }.compact
  end

  def safe_params
    @safe_params ||= params.permit(
      :email,
      :id,
      :name,
      :password
    )
    @safe_params[:email] = @safe_params[:email].downcase if @safe_params[:email]
    Rails.logger.ap '@safe_params': @safe_params
    @safe_params
  end
end
