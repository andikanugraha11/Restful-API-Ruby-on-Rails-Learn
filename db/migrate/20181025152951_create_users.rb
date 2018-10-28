class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :age
      t.timestamps  null:false
    end
  end
end