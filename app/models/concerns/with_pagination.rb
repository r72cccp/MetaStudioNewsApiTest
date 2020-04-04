# frozen_string_literal: true

# frozen_string_literal: true

module WithPagination
  extend ActiveSupport::Concern

  class_methods do
    def page(page_number: 1)
      start_position = (page_number - 1) * records_per_page
      offset(start_position).limit(records_per_page)
    end

    def records_per_page
      @records_per_page ||= (ENV['RECORDS_PER_PAGE'] || '20').to_i
    end

    def total_pages
      (total_count.to_f / records_per_page).ceil
    end

    def total_count
      count
    end

    def metadata
      {
        records_per_page: records_per_page,
        total_count: total_count,
        total_pages: total_pages,
      }
    end
  end
end
