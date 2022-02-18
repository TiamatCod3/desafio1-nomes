class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :register
      t.string :phone
      t.string :mail
      t.string :uffmail
      t.string :status

      t.timestamps
    end
  end
end
