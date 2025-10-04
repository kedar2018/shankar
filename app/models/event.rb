# frozen_string_literal: true
class Event < ApplicationRecord
  include Slugifiable

  scope :published, -> { where(published: true) }

  validates :title, :event_date, presence: true

  # Ransack allowlists
  def self.ransackable_attributes(_ = nil)
    %w[id title slug published event_date location description created_at updated_at]
  end

  def self.ransackable_associations(_ = nil)
    []
  end
end
