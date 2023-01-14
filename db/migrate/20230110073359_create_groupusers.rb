class CreateGroupusers < ActiveRecord::Migration[6.1]
  def change
    create_table :groupusers do |t|
      t.references  :group, index: true, foreign_key: true
      t.references  :customer,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
