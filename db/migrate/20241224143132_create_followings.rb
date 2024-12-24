class CreateFollowings < ActiveRecord::Migration[7.2]
  def change
    create_table :followings do |t|
      t.integer "follower_id"
      t.integer "followee_id"

      t.timestamps
    end
  end
end
