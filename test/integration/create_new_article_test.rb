require "test_helper"

class CreateNewArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "peggygou", email: "peggygou@gmail.com", password: "password", admin: false)
    @travel_category = Category.create(name: "Travel")
    signin_as(@user)

    test "get new article form and create article" do
      get "/articles/new"
      assert_response :success
      assert_difference "Article.count", 1 do
        post articles_path, params: { article: { title: "Sports while traveling", description: "test description bla blabla", category_ids: [@travel_category] } }
        assert_response :redirect
      end
      follow_redirect!
      assert_response :success
      assert_match "Sports while traveling", response.body
    end
  end
end
