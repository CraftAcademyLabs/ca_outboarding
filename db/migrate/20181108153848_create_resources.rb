class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :description
      t.string :url
      t.integer :type

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
