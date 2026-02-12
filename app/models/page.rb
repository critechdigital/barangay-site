class Page < ApplicationRecord
  belongs_to :site

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: { scope: :site_id }

  PAGE_TYPES = %w[transparency foi services officials contact custom].freeze

  scope :published, -> { where(published: true) }

  before_validation :generate_slug, if: -> { slug.blank? && title.present? }

  private

  def generate_slug
    self.slug = title.parameterize
  end
end
