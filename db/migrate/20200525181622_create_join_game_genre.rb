class CreateJoinGameGenre < ActiveRecord::Migration[6.0]
  def change
    create_table :join_game_genres do |t|
      t.string :game
      t.string :genre
    end
  end
end
