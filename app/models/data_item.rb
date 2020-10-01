class DataItem < ApplicationRecord

  has_one_attached :attached_file
  has_many :comments, dependent: :destroy

  validates :name, presence: true

end
