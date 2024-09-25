class Restaurant < ApplicationRecord
  CATEGORIES = [ "chinese", "italian", "japanese", "french", "belgian" ]
  validates :category, inclusion: { in: CATEGORIES }
  validates :name, :address, presence: true
  has_many :reviews, dependent: :destroy
  # has_many :reviews, dependent: :destroy
end

# A restaurant must have a name, an address and a category.
# A restaurant’s category must belong to this fixed list: ["chinese", "italian", "japanese", "french", "belgian"].
# When a restaurant is destroyed, all of its reviews must be destroyed as well.
# A review must belong to a restaurant.
# A review must have a content.
# A review must have a rating.
# A review’s rating must be a number between 0 and 5.
# A review’s rating must be an integer. For example, a review with a rating of 2.5 should be invalid!
