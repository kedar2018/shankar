# frozen_string_literal: true
class Page < ApplicationRecord
  include Slugifiable

  scope :published, -> { where(published: true) }

  validates :title, :body, presence: true

  # Ransack allowlists
  def self.ransackable_attributes(_ = nil)
    %w[id title slug published created_at updated_at body]
  end

  def self.ransackable_associations(_ = nil)
    []
  end
end
