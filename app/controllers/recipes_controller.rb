class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    #binding.pry
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)

    if @recipe.save
      flash[:success] = "Your recipe has been created successfully!"
      redirect_to recipes_path #Mostra a lista de receitas após salvar
    else
      render :new # Se erros forem encontrados, o formulário NEW volta a ser exibido.
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash[:success] = "Your recipe has been updated successfully!"
      redirect_to recipe_path(@recipe) # Em recipe_path, temos que informar o objeto que contém a receita editada, para ser exibida.
    else
      render :edit
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description)
    end

end
