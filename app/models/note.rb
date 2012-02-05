class Note < ActiveRecord::Base
  has_attached_file :photo,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>" }
       
  validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/png']
       
  belongs_to :user 
  belongs_to :notebook
end
