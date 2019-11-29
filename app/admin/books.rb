ActiveAdmin.register Book do
  permit_params :title, :description, :image, :author

  index do
      selectable_column
      id_column
      column :title
      column :description
      column :image
      column :author
      actions
    end

  filter :author

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Book" do
      f.input :title
      f.input :description, type: "Text"
      f.input :author
      f.input :image, :as => :file #, :hint => f.template.image_tag(f.object.image.url(:medium)
    end
    f.actions
  end

  show do
    panel "Book" do
      attributes_table_for book do
        row :title
        row :description
        row :author
        row :image do
          image_tag(book.try(:image).try(:url))
        end
        row :created_at
        row :updated_at
      end
    end
  end
end
