class CoffeeTypesForm < BaseForm
  include ActiveModel::Model

  attr_accessor :name, :recipe, :id

  def self.model_name
    ActiveModel::Name.new(CoffeeType)
  end

  def self.populate_edit_form(coffee_type)
    coffee_type_form = new(id: coffee_type.id,
                          name: coffee_type.name,
                          recipe: coffee_type.recipe
                          )
  end

  def save_form(params)
    return false unless valid?
    CoffeeType.transaction do
      coffee_type = CoffeeType.new(coffee_type_params)
      coffee_type.save!
    end
  end


  private

  def coffee_type_params
    { id: id,
      name: name,
      recipe: recipe
    }
  end

end
