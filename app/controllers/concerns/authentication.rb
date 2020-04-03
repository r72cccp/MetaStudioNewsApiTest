# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :auth_user
  end

  private

  def safe_auth
    Current.user = ::AuthorizeApiRequest.call(request.headers).result
    Current.request_id = request.uuid
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
  end

  def auth_user
    safe_auth

    render status: :unauthorized, json: { error: 'Not Authorized' } if Current.user.nil?
  end
end
