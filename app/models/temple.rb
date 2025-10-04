# frozen_string_literal: true
class Temple < ApplicationRecord
  include Slugifiable

  scope :published, -> { where(published: true) }

  validates :name, presence: true

  # Ransack allowlists
  def self.ransackable_attributes(_ = nil)
    %w[id name city address latitude longitude description slug published created_at updated_at]
  end

  def self.ransackable_associations(_ = nil)
    []
  end
end
