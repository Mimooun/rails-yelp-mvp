class Restaurant < ApplicationRecord

  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  before_destroy :destroy_reviews

  private

  def destroy_reviews
    reviews.destroy_all
  end
  
end
