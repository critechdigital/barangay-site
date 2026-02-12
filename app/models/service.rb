class Service < ApplicationRecord
  belongs_to :site

  validates :name, presence: true

  CATEGORIES = ["Certificates", "Business", "Protection", "Peace & Order", "Health", "Social Services", "Other"].freeze
end
