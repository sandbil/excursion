class Category < ActiveRecord::Base
    has_many :tours, dependent: :destroy
	before_destroy :ref_category, prepend: true
    validates :name, presence: true, uniqueness: { case_sensitive: false }
	
   private
   # убеждаемся в отсутствии экскурсий, ссылающихся на данный город
   def ref_category
        if tours.unscoped.where(category_id: self).empty?
           return true
        else
           return false
        end
    end
end
