require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'can delete articles' do
    assert_difference('Article.count', -1) do
      delete article_path(articles(:one))
    end

    assert_redirected_to root_path
    assert_equal 'Article was successfully destroyed.', flash[:notice]
  end
end
