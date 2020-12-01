class AddIndexToLanguages < ActiveRecord::Migration[6.0]
  def change
    add_index :languages, :name
  end
end
