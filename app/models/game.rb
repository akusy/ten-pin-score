# t.integer  "total"
# t.integer  "hash_key"
# t.datetime "created_at"
# t.datetime "updated_at"

class Game < ActiveRecord::Base
  has_many :frames, dependent: :destroy
end
