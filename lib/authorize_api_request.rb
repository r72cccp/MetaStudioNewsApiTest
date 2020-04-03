# frozen_string_literal: true

class AuthorizeApiRequest
  prepend SimpleCommand

  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    errors.add(:token, 'Missing token') unless header_token
    user || errors.add(:token, 'Invalid token') && nil
  end

  private

  def user
    return unless decoded_auth_token

    @user ||= User.find_by(id: decoded_auth_token[:user_id])
  end

  def decoded_auth_token
    @decoded_auth_token ||= ::JsonWebToken.decode(header_token)
  end

  def header_token
    headers['Authorization']&.split(' ')&.last
  end
end
