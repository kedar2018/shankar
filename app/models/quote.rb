# frozen_string_literal: true
class Quote < ApplicationRecord
  include Slugifiable

  scope :published, -> { where(published: true) }

  validates :content, presence: true

  # Ransack allowlists
  def self.ransackable_attributes(_ = nil)
    %w[id content source slug published created_at updated_at]
  end

  def self.ransackable_associations(_ = nil)
    []
  end
end
