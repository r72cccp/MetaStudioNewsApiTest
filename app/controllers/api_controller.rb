# frozen_string_literal: true

require 'json'

class ApiController < ApplicationController
  include Authentication

  before_action :set_locale
  before_action :set_origin

  private

  def set_locale
    I18n.locale = params[:current_locale] || I18n.default_locale
  end

  def set_origin
    @origin = params.permit(:origin).to_h.deep_symbolize_keys[:origin]
    Current.origin = @origin
  end
end
