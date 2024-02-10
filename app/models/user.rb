class User < ApplicationRecord
  has_many :airdrops
  has_many :transfers
  has_many :bookmarks
end
