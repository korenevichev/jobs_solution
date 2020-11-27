class CreateJoinTableJobShift < ActiveRecord::Migration[6.0]
  def change
    create_join_table :jobs, :shifts do |t|
      # t.index [:job_id, :shift_id]
      # t.index [:shift_id, :job_id]
    end
  end
end
