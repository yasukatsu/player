class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :player_id
      t.integer :team_id
      t.string :image
      t.string :name
      t.string :name_kana
      t.integer :birthday

      t.integer :height
      t.integer :weight

      t.string :position
      t.string :dominant_arm
      t.string :st_position

      t.string :graduate

      t.timestamps
    end
  end
end
