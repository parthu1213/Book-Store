class Book < ApplicationRecord
   belongs_to :user , optional: true
   belongs_to :category , optional: true
   has_many :reviews

   has_attached_file :image, styles: { medium: "300*300>", thumb: "100*100" }, default_url: "/images/start_project3.jpg"
     validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
