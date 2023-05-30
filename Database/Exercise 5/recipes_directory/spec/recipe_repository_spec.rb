require 'recipe_repository'

RSpec.describe RecipeRepository do

  def reset_recipes_table
    seed_sql = File.read('spec/recipes_directory_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipe_directory_test' })
    connection.exec(seed_sql)
  end

    before(:each) do 
      reset_recipes_table
    end

  it 'returns a list of recipes' do
    
    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq(2) # => 2
    expect(recipes.first.id).to eq('1') # => '1'
    expect(recipes.first.name).to eq('curry') # => 'curry'
    expect(recipes.first.cooking_time).to eq('20')# => '20'
    expect(recipes.first.rating).to eq('5') # => '5'
  end 
  
  it 'returns curry as a single recipe' do  

    repo = RecipeRepository.new

    recipe = repo.find(1)

    expect(recipe.first.name).to eq('curry') # => 'curry' 
    expect(recipe.first.cooking_time).to eq('20') # => '20'
    expect(recipe.first.rating).to eq('5') # => '5'
  end 
  
  it 'returns Lasagne as another recipe' do

    repo = RecipeRepository.new
    
    recipe = repo.find(2)

    expect(recipe.first.name).to eq('Lasagne') # => 'Lasagne'
    expect(recipe.first.cooking_time).to eq('50') #=> '50'
    expect(recipe.first.rating).to eq('1') # => '1'
  end

end 