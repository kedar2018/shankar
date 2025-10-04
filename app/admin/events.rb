ActiveAdmin.register Event do
  permit_params :title, :slug, :event_date, :location, :description, :published

  controller do
    def find_resource
      scoped_collection.find_by!(slug: params[:id])
    end
  end

  filter :title
  filter :event_date
  filter :location
  filter :slug
  filter :published
  filter :created_at

  index do
    selectable_column
    id_column
    column :title
    column :event_date
    column :location
    column :published
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug, hint: "Leave blank to auto-generate"
      f.input :event_date, as: :datepicker
      f.input :location
      f.input :published
      f.input :description, as: :text, input_html: { rows: 12 }
    end
    f.actions
  end
end
