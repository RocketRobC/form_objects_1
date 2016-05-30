require 'test_helper'

class CoffeeNotesControllerTest < ActionController::TestCase
  setup do
    @coffee_note = coffee_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coffee_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coffee_note" do
    assert_difference('CoffeeNote.count') do
      post :create, coffee_note: { date: @coffee_note.date, notes: @coffee_note.notes, rating: @coffee_note.rating, type: @coffee_note.type }
    end

    assert_redirected_to coffee_note_path(assigns(:coffee_note))
  end

  test "should show coffee_note" do
    get :show, id: @coffee_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coffee_note
    assert_response :success
  end

  test "should update coffee_note" do
    patch :update, id: @coffee_note, coffee_note: { date: @coffee_note.date, notes: @coffee_note.notes, rating: @coffee_note.rating, type: @coffee_note.type }
    assert_redirected_to coffee_note_path(assigns(:coffee_note))
  end

  test "should destroy coffee_note" do
    assert_difference('CoffeeNote.count', -1) do
      delete :destroy, id: @coffee_note
    end

    assert_redirected_to coffee_notes_path
  end
end
