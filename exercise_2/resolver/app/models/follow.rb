# == Schema Information
#
# Table name: follows
#
#  id                   :bigint           not null, primary key
#  follow_resource_type :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  follow_resource_id   :string(255)
#  follower_id          :bigint
#
# Indexes
#
#  index_follows_on_follower_id  (follower_id)
#
# Foreign Keys
#
#  fk_rails_...  (follower_id => users.id)
#
class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :followee_person, class_name: 'User', foreign_key: 'follow_resource_id'
end
