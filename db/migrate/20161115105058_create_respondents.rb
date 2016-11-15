class CreateRespondents < ActiveRecord::Migration[5.0]
  def change
    create_table :respondents do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
