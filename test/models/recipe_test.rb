require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new(name: "Lasanha de queijo", summary: "A melhor lasanha de Guarulhos",
    description: "Faça a massa ou compre pronta, faça  as camadas e coloque no forno por 6 horas.")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "name shoud be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "name length should not be too short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end

  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end

  test "summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end

  test "description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end

end
