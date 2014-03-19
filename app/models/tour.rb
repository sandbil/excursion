class Tour < ActiveRecord::Base
    default_scope -> { where(public: true) }
    belongs_to :city
    belongs_to :category
    has_many :tour_photos, dependent: :destroy
    accepts_nested_attributes_for :tour_photos, allow_destroy: true


	validates :name, :description, :city_id, :category_id, presence: true
	validates :name, uniqueness: { case_sensitive: false }

    PerPageTour = 5
    def self.tour_page(pg, city_id)
      pg = pg.to_i - 1
      self.order('id').where(city_id: city_id).limit(PerPageTour).offset((pg)*PerPageTour)
    end

    def self.pgcount(city_id)
      if PerPageTour == 0
        (self.where(city_id: city_id).count.to_f / (PerPageTour + 1)).ceil
      else
        (self.where(city_id: city_id).count.to_f / PerPageTour).ceil
      end
    end

end
