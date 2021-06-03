class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.date :concert_date
      t.integer :duration
      t.integer :audience
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
