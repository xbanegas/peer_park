require 'test_helper'

class SpacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @space = spaces(:one)
  end

  test "should get index" do
    get spaces_url
    assert_response :success
  end

  test "should get new" do
    get new_space_url
    assert_response :success
  end

  test "should create space" do
    assert_difference('Space.count') do
      post spaces_url, params: { space: { address: @space.address, avail_f: @space.avail_f, avail_m: @space.avail_m, avail_sa: @space.avail_sa, avail_su: @space.avail_su, avail_t: @space.avail_t, avail_th: @space.avail_th, avail_w: @space.avail_w, city: @space.city, description: @space.description, hourly_rate: @space.hourly_rate, size: @space.size, state: @space.state, user_id: @space.user_id, zip: @space.zip } }
    end

    assert_redirected_to space_url(Space.last)
  end

  test "should show space" do
    get space_url(@space)
    assert_response :success
  end

  test "should get edit" do
    get edit_space_url(@space)
    assert_response :success
  end

  test "should update space" do
    patch space_url(@space), params: { space: { address: @space.address, avail_f: @space.avail_f, avail_m: @space.avail_m, avail_sa: @space.avail_sa, avail_su: @space.avail_su, avail_t: @space.avail_t, avail_th: @space.avail_th, avail_w: @space.avail_w, city: @space.city, description: @space.description, hourly_rate: @space.hourly_rate, size: @space.size, state: @space.state, user_id: @space.user_id, zip: @space.zip } }
    assert_redirected_to space_url(@space)
  end

  test "should destroy space" do
    assert_difference('Space.count', -1) do
      delete space_url(@space)
    end

    assert_redirected_to spaces_url
  end
end
