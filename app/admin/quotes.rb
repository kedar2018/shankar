ActiveAdmin.register Quote do
  permit_params :content, :source, :slug, :published

  controller do
    def find_resource
      scoped_collection.find_by!(slug: params[:id])
    end
  end

  filter :content
  filter :source
  filter :slug
  filter :published
  filter :created_at

  index do
    selectable_column
    id_column
    column(:content) { |q| truncate(q.content.to_s, length: 120) }
    column :source
    column :published
    actions
  end

  form do |f|
    f.inputs do
      f.input :content, as: :text, input_html: { rows: 8 }
      f.input :source
      f.input :slug, hint: "Leave blank to auto-generate"
      f.input :published
    end
    f.actions
  end
end
