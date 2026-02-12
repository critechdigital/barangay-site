class ServiceStep < ApplicationRecord
  belongs_to :service

  validates :step_number, presence: true
  validates :title, presence: true

  default_scope { order(:step_number) }
end
