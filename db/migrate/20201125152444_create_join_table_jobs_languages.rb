class CreateJoinTableJobsLanguages < ActiveRecord::Migration[6.0]
  def change
    create_join_table :jobs, :languages do |t|
      # t.index [:job_id, :language_id]
      # t.index [:language_id, :job_id]
    end
  end
end
