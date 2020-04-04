# frozen_string_literal: true

class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.string :origin, null: false
      t.string :origin_url
      t.text :html_content, null: false
      t.string :age_category, null: false, index: true
      t.string :news_category, null: false, index: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
