require 'test_helper'

class CategoriesTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid " do
    assert @category.valid?
  end
  test "category should be presend" do
    @category.name = " "
    assert_not @category.valid?
  end
  test "shoud not have the same name" do
    @category.save
    category2 = Category.new(name: "sports")

    assert_not category2.valid?
  end
  test "Name shoud not be too long" do
    category3 = Category.new(name: "sp")
    assert_not category3.valid?
  end
  test "Name should not be too long" do
  category4 = Category.new(name: "sp"*26)
  assert_not category4.valid?
  end
end