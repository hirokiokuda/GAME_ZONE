class CreateGameDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :game_details do |t|

      t.timestamps
    end
  end
end
