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
require 'rails_helper'

RSpec.describe Follow, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
