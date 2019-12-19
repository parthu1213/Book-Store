ActiveAdmin.register Book do
  permit_params :title, :description, :img, :author, :price

  controller do
    def create
      @book = Book.create!(book_params)
      respond_to do |format|
        if @book.save
          format.html { render :index, notice: 'Book was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    private
    def book_params
      params.require(:book).permit(:title, :description, :author, :category_id, :img, :price)
    end
  end


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
