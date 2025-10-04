# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Page.find_or_create_by!(slug: "biography") do |p|
  p.title = "Biography"
  p.body  = "Add a respectful biography here."
  p.published = true
end

Page.find_or_create_by!(slug: "teachings") do |p|
  p.title = "Teachings"
  p.body  = "Core guidance and messages."
  p.published = true
end

Event.find_or_create_by!(slug: "gurupournima-2026") do |e|
  e.title = "Guru Purnima"
  e.event_date = Date.new(2026, 7, 12) rescue Date.today
  e.location = "Pune"
  e.description = "Celebration and satsang."
  e.published = true
end

Quote.find_or_create_by!(slug: "blessing-1") do |q|
  q.content = "Add an authentic quote with source."
  q.source  = "— Source"
  q.published = true
end

Temple.find_or_create_by!(slug: "pune-ashram") do |t|
  t.name = "Pune Ashram"
  t.city = "Pune"
  t.address = "Maharashtra"
  t.description = "Temple/ashram details."
  t.published = true
end

if AdminUser.where(email: "admin@example.com").blank?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end
