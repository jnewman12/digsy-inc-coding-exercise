class CreateAgentActions < ActiveRecord::Migration
  def change
    create_table :agent_actions do |t|
      t.string     :image_link
      t.string     :title
      t.boolean    :performed, default: false
      t.boolean    :ignored, default: false
      t.timestamps null: false
    end
  end
end
