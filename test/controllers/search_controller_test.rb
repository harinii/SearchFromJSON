require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "successful search" do
    results = SearchController.SearchMe("user", "name", "Morris Ayers")
    assert_not_empty(results)
  end


end
