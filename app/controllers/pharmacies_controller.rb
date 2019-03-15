class PharmaciesController < ApplicationController
  def index
    @pharmacies = Pharmacy.all

    render("pharmacy_templates/index.html.erb")
  end

  def show
    @pharmacy = Pharmacy.find(params.fetch("id_to_display"))

    render("pharmacy_templates/show.html.erb")
  end

  def new_form
    @pharmacy = Pharmacy.new

    render("pharmacy_templates/new_form.html.erb")
  end

  def create_row
    @pharmacy = Pharmacy.new

    @pharmacy.address = params.fetch("address")
    @pharmacy.hours = params.fetch("hours")
    @pharmacy.rating = params.fetch("rating")
    @pharmacy.api_credentials = params.fetch("api_credentials")

    if @pharmacy.valid?
      @pharmacy.save

      redirect_back(:fallback_location => "/pharmacies", :notice => "Pharmacy created successfully.")
    else
      render("pharmacy_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @pharmacy = Pharmacy.find(params.fetch("prefill_with_id"))

    render("pharmacy_templates/edit_form.html.erb")
  end

  def update_row
    @pharmacy = Pharmacy.find(params.fetch("id_to_modify"))

    @pharmacy.address = params.fetch("address")
    @pharmacy.hours = params.fetch("hours")
    @pharmacy.rating = params.fetch("rating")
    @pharmacy.api_credentials = params.fetch("api_credentials")

    if @pharmacy.valid?
      @pharmacy.save

      redirect_to("/pharmacies/#{@pharmacy.id}", :notice => "Pharmacy updated successfully.")
    else
      render("pharmacy_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @pharmacy = Pharmacy.find(params.fetch("id_to_remove"))

    @pharmacy.destroy

    redirect_to("/pharmacies", :notice => "Pharmacy deleted successfully.")
  end
end
