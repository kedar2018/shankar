ActiveAdmin.register Photo do
  permit_params :title, :caption, :slug, :published, :image

  # Find records by slug in /admin as well
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
    column :caption
    column :published
    column :image do |p|
      image_tag url_for(p.image), style: "max-width:80px;height:auto;" if p.image.attached?
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :caption
      row :slug
      row :published
      row :image do |p|
        image_tag url_for(p.image), style: "max-width:240px;height:auto;" if p.image.attached?
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :caption
      f.input :slug, hint: "Leave blank to auto-generate"
      f.input :published
      f.input :image, as: :file
    end
    f.actions
  end
end
