class CreateJoinGamePlatform < ActiveRecord::Migration[6.0]
  def change
    create_table :join_game_platforms do |t|
      t.string :game
      t.string :platform
    end
  end
end
