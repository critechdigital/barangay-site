class Official < ApplicationRecord
  belongs_to :site

  validates :name, presence: true
  validates :position, presence: true
end
