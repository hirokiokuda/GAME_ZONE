class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name, null: false, default: ""
      t.string :introduction, null: false, default: ""
      t.timestamps
    end
  end
end
