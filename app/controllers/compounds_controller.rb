class CompoundsController < ApplicationController
  def index
    @compounds = Compound.all

    render("compound_templates/index.html.erb")
  end

  def show
    @compound = Compound.find(params.fetch("id_to_display"))

    render("compound_templates/show.html.erb")
  end

  def new_form
    @compound = Compound.new

    render("compound_templates/new_form.html.erb")
  end

  def create_row
    @compound = Compound.new

    @compound.patient_id = params.fetch("patient_id")

    if @compound.valid?
      @compound.save

      redirect_back(:fallback_location => "/compounds", :notice => "Compound created successfully.")
    else
      render("compound_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @compound = Compound.find(params.fetch("prefill_with_id"))

    render("compound_templates/edit_form.html.erb")
  end

  def update_row
    @compound = Compound.find(params.fetch("id_to_modify"))

    @compound.patient_id = params.fetch("patient_id")

    if @compound.valid?
      @compound.save

      redirect_to("/compounds/#{@compound.id}", :notice => "Compound updated successfully.")
    else
      render("compound_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @compound = Compound.find(params.fetch("id_to_remove"))

    @compound.destroy

    redirect_to("/compounds", :notice => "Compound deleted successfully.")
  end
end
