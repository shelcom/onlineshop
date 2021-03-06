class Instrument < ApplicationRecord
  before_destroy :not_refereced_by_any_line_item
  belongs_to :user, optional: true
  has_many   :line_items
  has_many   :comments
  has_many   :likes, dependent: :destroy
  paginates_per 8
  mount_uploader :image, ImageUploader
  serialize :image, JSON # If you use SQLite, add this line

  validates :title, :brand, :price, :model, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: { maximum: 7 }

  BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS  Ibanez Charvel Washburn }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

 def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
  
  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("title LIKE ?", "%#{search}%")
  end
end
