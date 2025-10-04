# frozen_string_literal: true
module Slugifiable
  extend ActiveSupport::Concern

  included do
    before_validation :ensure_slug
    validates :slug, presence: true, uniqueness: true

    # Use slug in URLs
    def to_param = slug
  end

  private

  def ensure_slug
    base =
      if respond_to?(:title) && title.present?
        title
      elsif respond_to?(:name) && name.present?
        name
      else
        SecureRandom.hex(3)
      end

    self.slug = base.to_s.parameterize if slug.blank?
  end
end
