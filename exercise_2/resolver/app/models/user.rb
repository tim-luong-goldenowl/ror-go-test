# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string(255)
#  username   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :follows, foreign_key: "follow_resource_id", class_name: "Follow"
  has_many :followers, foreign_key: "follower_id", class_name: "Follow"

  def follow(follower)
    followers.create(follower_id: id, follow_resource_type: follower.class.name, follow_resource_id: follower.id)
  end

  def unfollow(follower)
    followers.find(follow_resource_type: follower.class.name, follow_resource_id: follower.id).destroy
  end

  def new_follows_in_current_month
    follows.where(created_at: [Time.current.at_beginning_of_month..Time.current])
  end

  def new_follows_in_current_month
    select(:id)
  end

  def self.top_10_users_with_most_followers
    sql = %{
        SELECT users.id, users.username, users.email, (select count(*) from follows where follows.follow_resource_id = users.id) as follow_count
        FROM users
        ORDER BY follow_count DESC
        LIMIT 10
        }

    find_by_sql(sql)
  end
end


