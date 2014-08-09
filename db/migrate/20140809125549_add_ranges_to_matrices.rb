class AddRangesToMatrices < ActiveRecord::Migration
  def change
    add_column :matrices, :max, :integer
    add_column :matrices, :min, :integer
  end
end
