class Announcement < ApplicationRecord
  belongs_to :site

  validates :title, presence: true
  validates :body, presence: true

  scope :published, -> { where(published: true).order(published_at: :desc) }
  scope :recent, -> { published.limit(5) }

  before_save :set_published_at

  private

  def set_published_at
    self.published_at = Time.current if published && published_at.nil?
  end
end
