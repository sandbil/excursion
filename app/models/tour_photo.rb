class TourPhoto < ActiveRecord::Base
  belongs_to :tour
  has_attached_file :photo,
                    :url  => "/photo/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/photo/:id/:style/:basename.:extension",
                    :styles => { :large => '300x300>', :medium => "150x150>", :thumb => "100x100>" },
                    :preserve_files => true
  # Проверка тип содержимого
  validates_attachment_content_type  :photo ,  :content_type  =>  /\Aimage/
  # Проверка файла
  validates_attachment_file_name  :photo ,  :matches   =>  [/png\Z/, /jp?g\Z/]
  # Явно не проверяют
  do_not_validate_attachment_file_type  :photo
end
