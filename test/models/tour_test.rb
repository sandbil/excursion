require 'test_helper'

class TourTest < ActiveSupport::TestCase
  test "tour attributes must not be empty" do
    # свойства товара не должны оставаться пустыми
    tour = Tour.new
    assert tour.invalid?
    assert tour.errors[:name].any? , "field name must not be empty"
    assert tour.errors[:description].any? , "field description must not be empty"
    assert tour.errors[:city_id].any?, "field city_id must not be empty"
    assert tour.errors[:category_id].any?, "field category_id must not be empty"
  end

  test "property public true" do
    assert_difference("Tour.count", 1, "error") do
      tour = Tour.new(name: "example", description: "Это тестовая экскурсия",
                      public: true, city_id: cities(:one).id,  category_id: categories(:one).id)
      tour.save!
    end
  end
  test "property public false" do
    assert_no_difference("Tour.count", "error") do
      tour = Tour.new(name: "example1", description: "Это тестовая экскурсия",
                      public: false,city_id: cities(:one).id,  category_id: categories(:one).id)
      tour.save!
    end
    assert_difference("Tour.unscoped.count", 1,"error") do
      tour = Tour.new(name: "example2", description: "Это тестовая экскурсия",
                      public: false,city_id: cities(:one).id,  category_id: categories(:one).id)
      tour.save!
    end
  end

  test "page count" do
    # в фикстуре с городом :two есть 5 туров с public true и 1 тур с public false
    # при количестве на странице в 5 туров количество страниц 1
    assert_equal 1 , Tour.pgcount(cities(:two).id) , "1 error page count"
    # добавляем тур с public: false
    #количество страниц  не поменялось
    tour = Tour.new(name: "example4", description: "Это тестовая экскурсия",
                    public: false, city_id: cities(:two).id,  category_id: categories(:one).id)
    tour.save!
    assert_equal 1 , Tour.pgcount(cities(:two).id) , "2 error page count"

    # добавляем тур с public: true
    # 6 тур с public: true уже на 2 странице
    tour = Tour.new(name: "example5", description: "Это тестовая экскурсия",
                    public: true, city_id: cities(:two).id,  category_id: categories(:one).id)
    tour.save!
    assert_equal 2 , Tour.pgcount(cities(:two).id) , "2 error page count"
  end

  test "page" do
    assert_equal "MyString1" , Tour.page(1,cities(:one).id).first.name , "1 error page"
    # 2 страницы не существует
    assert_equal true , Tour.page(2,cities(:one).id).first.nil? , "2 error page"
  end
end
