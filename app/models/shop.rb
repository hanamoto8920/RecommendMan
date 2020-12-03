class Shop < ApplicationRecord
  
  attachment :image
  validates :name, presence: true
  validates :image, presence: true
  
  has_many :tags, dependent: :destroy
  
  belongs_to :place
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
