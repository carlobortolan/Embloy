class AddJobCounterCacheToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :job_count, :integer
  end
end
