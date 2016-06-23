require 'test_helper'

class CreatCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "ap111sd", email: "ddfp11@gmail.com", password: "p11ddd", admin: "true")
  end
  test "get new categories form and create category" do
    sign_in_as(@user,"p11ddd")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template 'categories/index'
    assert_match 'sports', response.body
  end
  test "Invalid category submission result in failure" do
    sign_in_as(@user,"p11ddd")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end