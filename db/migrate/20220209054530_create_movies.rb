class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
       t.string :movie_name
      t.string :year
      t.string :rate
      t.string :director
      t.timestamps
    end
  end
end
