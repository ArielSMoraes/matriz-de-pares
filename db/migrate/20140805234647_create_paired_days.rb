class CreatePairedDays < ActiveRecord::Migration
  def change
    create_table :paired_days do |t|
      t.date :date
      t.references :person, index: true
      t.references :pair, index: true

      t.timestamps
    end
  end
end
