ActiveAdmin.register Temple do
  permit_params :name, :city, :address, :latitude, :longitude, :description, :slug, :published

  controller do
    def find_resource
      scoped_collection.find_by!(slug: params[:id])
    end
  end

  filter :name
  filter :city
  filter :slug
  filter :published
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :city
    column :address
    column :published
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :slug, hint: "Leave blank to auto-generate"
      f.input :city
      f.input :address
      f.input :latitude
      f.input :longitude
      f.input :published
      f.input :description, as: :text, input_html: { rows: 12 }
    end
    f.actions
  end
end
