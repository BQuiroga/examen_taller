class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
