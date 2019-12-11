ActiveAdmin.register Book do
  permit_params :title, :description, :img, :author,

  index do
      selectable_column
      id_column
      column :title
      column :description
      column :img
      column :author
      actions
    end
    


  filter :author

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Book" do
      f.input :title
      f.input :description, type: "Text"
      f.input :author
      f.input :img, :as => :file
      f.input :price
    end
    f.actions
  end

  show do
    panel "Book" do
      attributes_table_for book do
        row :title
        row :description
        row :author
        row :price
        row :img do
          if book.img.present?
            image_tag(book.try(:img))
          end
        end
        row :created_at
        row :updated_at
      end
    end
  end
end
