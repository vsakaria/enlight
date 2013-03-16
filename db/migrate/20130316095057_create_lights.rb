class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.string :topic
      t.text :message

      t.timestamps
    end
  end
end
