class FavoriteCompoundsController < ApplicationController
  def index
    @favorite_compounds = FavoriteCompound.all

    render("favorite_compound_templates/index.html.erb")
  end

  def show
    @favorite_compound = FavoriteCompound.find(params.fetch("id_to_display"))

    render("favorite_compound_templates/show.html.erb")
  end

  def new_form
    @favorite_compound = FavoriteCompound.new

    render("favorite_compound_templates/new_form.html.erb")
  end

  def create_row
    @favorite_compound = FavoriteCompound.new

    @favorite_compound.favorited_by = params.fetch("favorited_by")
    @favorite_compound.compound_id = params.fetch("compound_id")

    if @favorite_compound.valid?
      @favorite_compound.save

      redirect_back(:fallback_location => "/favorite_compounds", :notice => "Favorite compound created successfully.")
    else
      render("favorite_compound_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @favorite_compound = FavoriteCompound.find(params.fetch("prefill_with_id"))

    render("favorite_compound_templates/edit_form.html.erb")
  end

  def update_row
    @favorite_compound = FavoriteCompound.find(params.fetch("id_to_modify"))

    @favorite_compound.favorited_by = params.fetch("favorited_by")
    @favorite_compound.compound_id = params.fetch("compound_id")

    if @favorite_compound.valid?
      @favorite_compound.save

      redirect_to("/favorite_compounds/#{@favorite_compound.id}", :notice => "Favorite compound updated successfully.")
    else
      render("favorite_compound_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @favorite_compound = FavoriteCompound.find(params.fetch("id_to_remove"))

    @favorite_compound.destroy

    redirect_to("/favorite_compounds", :notice => "Favorite compound deleted successfully.")
  end
end
