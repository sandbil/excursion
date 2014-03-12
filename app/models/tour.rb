class Tour < ActiveRecord::Base
    default_scope -> { where(public: true) }
    belongs_to :city
    belongs_to :category
    has_many :tour_photos, dependent: :destroy
    accepts_nested_attributes_for :tour_photos, allow_destroy: true


	validates :name, :description, :city_id, :category_id, presence: true
	validates :name, uniqueness: { case_sensitive: false }

    PerPage = 5
    def self.page(pg, city_id)
      pg = pg.to_i - 1
      self.order('id').where(city_id: city_id).limit(PerPage).offset((pg)*PerPage)
    end

    def self.pgcount(city_id)
        #count % PerPage == 0 ? self.where(city_id: city_id).count / (PerPage + 1) : self.where(city_id: city_id).count / (PerPage + 1)
      if PerPage == 0
        (self.where(city_id: city_id).count.to_f / (PerPage + 1)).ceil
      else
        (self.where(city_id: city_id).count.to_f / PerPage).ceil
      end
    end

end
