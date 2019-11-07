require 'test_helper'

class DogTest < ActiveSupport::TestCase

  test "should say hi" do
    dog = create_dog
    assert_equal "woof-woof", dog.say_hi
  end

  private

  def create_dog(options = {})
    default_options = {
        name: "Rufus",
        age: 5
    }
    Dog.create(default_options.merge(options))
  end

end
