class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.integer    :user_id, index: true
      t.text       :note
      t.string     :browser
      t.string     :ip_address
      t.string     :controller
      t.string     :action
      t.string     :params
      t.timestamps null: false
    end
  end
end
