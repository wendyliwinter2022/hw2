class CreateTopCasts < ActiveRecord::Migration[7.0]
  def change
    create_table :top_casts do |t|
      t.integer :movie_id
      t.string :star_name
      t.string :role
      
      t.timestamps
    end
  end
end
