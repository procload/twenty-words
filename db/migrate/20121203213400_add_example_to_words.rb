class AddExampleToWords < ActiveRecord::Migration
  def change
    add_column :words, :example, :text
  end
end
