class DropEmpty < ActiveRecord::Migration
  def up
    drop_table :empties
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
