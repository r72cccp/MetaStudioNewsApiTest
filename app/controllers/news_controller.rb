# frozen_string_literal: true

class NewsController < ApiController
  before_action :set_news, only: %i[destroy update]

  def index
    @news = News.page(page_number: safe_params[:page_number])
    metadata = News.metadata.merge page_number: safe_params[:page_number]
    render json: @news, adapter: :json, root: :data, each_serializer: NewsListItemSerializer, meta: metadata
  end

  def create
    @news = News.create(**safe_create_params)
    render json: @news, serializer: NewsSerializer
  end

  def update
    @news.update(**safe_create_params.except(:id))
    render json: @news, serializer: NewsSerializer
  end

  def destroy
    @news.destroy
    render status: :ok
  end

  private

  def news_attributes
    @news_attributes ||= %i[
      age_category
      html_content
      news_category
      origin
      origin_url
      title
      user_id
    ]
  end

  def safe_params
    @safe_params ||= params.require(:metadata).permit(:page_number)
    @safe_params[:page_number] = @safe_params[:page_number].to_i if @safe_params[:page_number].present?
    @safe_params
  end

  def safe_create_params
    @safe_create_params ||= params.permit(*news_attributes)
    @safe_create_params[:user_id] = Current.user.id
    @safe_create_params
  end

  def safe_update_params
    @safe_update_params ||= params.permit(:id, *news_attributes)
  end

  def set_news
    @news = News.find(safe_update_params[:id])
  end
end
