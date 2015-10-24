require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new( chefname: "Eric Ohtake", email: "ericohtake@teste.com" )
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "Chef name must be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "Chef name must be no longer than 40 characters" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end

  test "Chef name must be no shorter than 3 characters" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end

  test "Email must be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "Email must not be too long" do
    @chef.email = "a" * 51 + "teste.com"
    assert_not @chef.valid?
  end

  test "Email must be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test "Email validation should accept valid address" do # Lecture 26 - Min 9:00
    valid_adresses = %w[ user@eee.com R_TDD-DS@eee.hello.org user@example.com lasanha.assada@piroca.net chuleta+pau@safado.com.br ]
    valid_adresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{ va.inspect } should be valid'
    end
  end

  test "Email validation should reject invalid address" do # Lecture 26 - Min 9:00
    invalid_address = %w[ user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com ]
    invalid_address.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ ia.inspect } should be invalid'
    end
  end

end
