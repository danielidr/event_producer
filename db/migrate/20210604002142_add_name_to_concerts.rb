class AddNameToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :name, :string
  end
end
