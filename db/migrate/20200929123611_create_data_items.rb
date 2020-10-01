class CreateDataItems < ActiveRecord::Migration[6.0]
  def change
    create_table :data_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
