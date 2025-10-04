ActiveAdmin.register Page do
  permit_params :title, :slug, :body, :published

  controller do
    def find_resource
      scoped_collection.find_by!(slug: params[:id])
    end
  end

  filter :title
  filter :slug
  filter :published
  filter :created_at

  index do
    selectable_column
    id_column
    column :title
    column :slug
    column :published
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug, hint: "Leave blank to auto-generate from title"
      f.input :published
      f.input :body, as: :text, input_html: { rows: 18 }
    end
    f.actions
  end
end
