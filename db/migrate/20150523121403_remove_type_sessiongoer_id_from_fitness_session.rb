class RemoveTypeSessiongoerIdFromFitnessSession < ActiveRecord::Migration
  def change
    remove_column :fitness_sessions, :type_sessiongoer_id, :integer
  end
end
