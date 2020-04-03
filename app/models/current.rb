# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :origin
  attribute :request_id, :user_agent, :ip_address

  resets { Time.zone = nil }

  def user=(user)
    super
    @user = user
  end

  def origin=(origin)
    super
    @origin = origin
  end
end
