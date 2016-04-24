class CreateParks < ActiveRecord::Migration[5.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :insta_tag

      t.timestamps
    end
  end
end
