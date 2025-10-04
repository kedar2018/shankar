# frozen_string_literal: true
class Photo < ApplicationRecord
  include Slugifiable

  has_one_attached :image

  scope :published, -> { where(published: true) }

  validates :title, presence: true

  # Ransack allowlists
  def self.ransackable_attributes(_ = nil)
    %w[id title caption slug published created_at updated_at]
  end

  def self.ransackable_associations(_ = nil)
    %w[image_attachment image_blob]
  end
end
