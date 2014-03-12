class City < ActiveRecord::Base
   has_many :tours, dependent: :destroy
   has_many :tour_photos, through: :tours
   before_destroy :ref_city, prepend: true
   validates :name, presence: true, uniqueness: { case_sensitive: false }

   
   private
   # убеждаемся в отсутствии экскурсий, ссылающихся на данный город
   def ref_city
     if tours.unscoped.where(city_id: self).empty?
       return true
     else
       return false
     end
    end
end
