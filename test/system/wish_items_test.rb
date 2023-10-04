require "application_system_test_case"

class WishItemsTest < ApplicationSystemTestCase
  setup do
    @wish_item = wish_items(:one)
  end

  test "visiting the index" do
    visit wish_items_url
    assert_selector "h1", text: "Wish items"
  end

  test "should create wish item" do
    visit wish_items_url
    click_on "New wish item"

    fill_in "Name", with: @wish_item.name
    fill_in "Price", with: @wish_item.price
    fill_in "Use", with: @wish_item.use
    click_on "Create Wish item"

    assert_text "Wish item was successfully created"
    click_on "Back"
  end

  test "should update Wish item" do
    visit wish_item_url(@wish_item)
    click_on "Edit this wish item", match: :first

    fill_in "Name", with: @wish_item.name
    fill_in "Price", with: @wish_item.price
    fill_in "Use", with: @wish_item.use
    click_on "Update Wish item"

    assert_text "Wish item was successfully updated"
    click_on "Back"
  end

  test "should destroy Wish item" do
    visit wish_item_url(@wish_item)
    click_on "Destroy this wish item", match: :first

    assert_text "Wish item was successfully destroyed"
  end
end
