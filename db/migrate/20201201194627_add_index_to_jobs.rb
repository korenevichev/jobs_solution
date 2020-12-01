class AddIndexToJobs < ActiveRecord::Migration[6.0]
  def change
    add_index :jobs, :title
  end
end
