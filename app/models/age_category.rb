class AgeCategory
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Serialization
  extend ActiveModel::Naming

  attr_accessor :value

  validates :value, presence: true

  def initialize(attributes)
    attributes.each do |name, value|
      send "#{name}=", value
    end
  end

  def self.all
    @all ||= ENV['AGE_CATEGORIES'].split(',').map do |age_category|
      AgeCategory.new(value: age_category)
    end
  end
end
