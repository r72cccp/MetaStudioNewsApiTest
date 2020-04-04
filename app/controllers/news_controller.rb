# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    @news = News.page(page_number: safe_params[:page_number])
    metadata = News.metadata.merge page_number: safe_params[:page_number]
    render json: @news, adapter: :json, root: :data, each_serializer: NewsListItemSerializer, meta: metadata
  end

  def create
    @news = News.create(safe_create_params)
    render json: @news, serializer: NewsSerializer
  end

  private

  def safe_params
    @safe_params ||= params.require(:metadata).permit(:page_number)
    @safe_params[:page_number] = @safe_params[:page_number].to_i if @safe_params[:page_number].present?
    @safe_params
  end

  def safe_create_params
    @safe_create_params ||= params.permit(
      :age_category,
      :html_content,
      :news_category,
      :origin,
      :origin_url,
      :title
    )
    @safe_create_params[:user_id] = Current.user.id
    @safe_create_params
  end
end
