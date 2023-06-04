class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :zoom_link
      t.string :invitee_emails_array, array: true, default: []
      t.boolean :is_public, default: false

      t.timestamps
    end
  end
end
