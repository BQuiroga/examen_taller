require 'test_helper'

class UserTest < ActiveSupport::TestCase

	setup do
		@usuario=users(:one)
	end
   test "peso_ideal" do

    assert @usuario.peso_ideal
  end
end
