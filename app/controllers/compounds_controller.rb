class CompoundsController < ApplicationController
  def index
    @patients = Patient.where(doctor_id: current_user.id)
    @compounds = Compound.where(patient_id: @patients.ids)

    render("compound_templates/index.html.erb")
  end

  def show
    @compound = Compound.find(params.fetch("id_to_display"))

    render("compound_templates/show.html.erb")
  end

  def new_form
    @compound = Compound.new
    @patients = Patient.where(doctor_id: current_user.id)

    render("compound_templates/new_form.html.erb")
  end

  def create_row
    @compound = Compound.new
    @concentrations = Concentration.new
    
    @compound.patient_id = params.fetch("patient_id")
    @concentrations.ingredient_id = params.fetch("ingredient_id")
    @concentrations.ingredient_concentration = params.fetch("ingredient_concentration")

    if @compound.valid? 
      @compound.save
      @concentrations.compound_id = @compound.id
      if @concentrations.valid?
        @concentrations.save
        redirect_to("/compounds/#{@compound.id}/edit", :notice => "Compound created successfully.")
      else
        @patients = Patient.where(doctor_id: current_user.id)
        render("compound_templates/new_form_with_errors.html.erb")
      end
    else
      @patients = Patient.where(doctor_id: current_user.id)
      render("compound_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @compound = Compound.find(params.fetch("prefill_with_id"))
    @patients = Patient.where(doctor_id: current_user.id)
    
    # @ingredients.names = @compound.ingredients
    # @ingredients.concentrations = @compound.concentrations.ingredient_concentration

    render("compound_templates/edit_form.html.erb")
  end

  def update_row
    @compound = Compound.find(params.fetch("id_to_modify"))

    @compound.patient_id = params.fetch("patient_id")
    # @compound.concentrations.ingredient_id = params.fetch("ingredient_id")
    # @compound.concentrations.ingredient_concentration = params.fetch("ingredient_concentration")
    @concentration = @compound.concentrations.new
    @concentration.ingredient_concentration = params.fetch("ingredient_concentration")
    @concentration.ingredient_id = params.fetch("ingredient_id")
    # @concentration.save
    # @compound.save

    if @compound.valid? && @concentration.valid?
      @compound.save
      @concentration.save

      redirect_to("/compounds/#{@compound.id}/edit", :notice => "Compound created successfully.")
    else
      @patients = Patient.where(doctor_id: current_user.id)
      render("compound_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @compound = Compound.find(params.fetch("id_to_remove"))

    @compound.destroy

    redirect_to("/compounds", :notice => "Compound deleted successfully.")
  end
end
