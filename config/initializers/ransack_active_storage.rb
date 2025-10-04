# config/initializers/ransack_active_storage.rb
# frozen_string_literal: true

Rails.application.config.to_prepare do
  # Allow minimal attributes so ActiveAdmin (via Ransack) can filter ActiveStorage
  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(_ = nil)
      %w[id name record_type record_id blob_id created_at]
    end

    def self.ransackable_associations(_ = nil)
      %w[blob]
    end
  end

  ActiveStorage::Blob.class_eval do
    def self.ransackable_attributes(_ = nil)
      %w[id filename content_type metadata byte_size checksum created_at]
    end

    def self.ransackable_associations(_ = nil)
      []
    end
  end
end
