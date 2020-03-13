class AddReferencesToDose < ActiveRecord::Migration[5.2]
  def change
    add_reference :doses, :cocktail
    add_reference :doses, :ingredient
  end
end
