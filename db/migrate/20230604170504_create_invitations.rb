class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.references :meeting, foreign_key: true
      t.string :status
      t.timestamps
    end
  end
end
