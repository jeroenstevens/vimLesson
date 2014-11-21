require 'test_helper'

class TodosTest < ActionDispatch::IntegrationTest

  test "does return a list of todos" do
    todos = create_list(:todo, 5)
    get "todos"

    assert_response :success
    assert_equal 5, json.count
  end

  test "does return a specific todo" do
    todo = create(:todo)
    get "todos/#{todo.id}"

    assert_response :success
    assert_equal todo.id, json['id']
  end

  test "does create a todo" do
    todo = build(:todo)
    payload = { todo: todo.attributes }.to_json

    post "todos", payload, jsonHeader

    assert_response :success
    assert_equal 201, status
  end

  test "does update a todo" do
    todo = create(:todo)
    new_value = "updated"
    payload = { todo: { title: new_value } }.to_json

    patch "todos/#{todo.id}", payload, jsonHeader

    assert_response :success
    assert_equal 200, status
    assert_equal new_value, json["title"]
  end

  test "does destroy a todo" do
    todo = create(:todo)

    delete "todos/#{todo.id}"

    assert_response :success
    assert_equal 204, status
  end

  def json
    @json ||= JSON.parse(response.body)
  end

  def jsonHeader
    return { 'CONTENT_TYPE' => 'application/json' }
  end
end
