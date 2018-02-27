class AddYearToMovieAwards < ActiveRecord::Migration[5.1]
  def change
    add_column :movie_awards, :year, :integer
  end
end
