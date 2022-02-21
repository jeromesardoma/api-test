require "test_helper"

class FoodJokeSubmitTest < ActionDispatch::IntegrationTest

test "food joke submit form retrieves joke successfully" do
  VCR.use_cassette("get new joke") do
    get search_path
    assert_select "p#result"
  end
end


end
