class AddApplicationCounterCacheToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :application_count, :integer
  end
end
