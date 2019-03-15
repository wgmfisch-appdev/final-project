class PatientsController < ApplicationController
  def index
    @patients = Patient.all

    render("patient_templates/index.html.erb")
  end

  def show
    @patient = Patient.find(params.fetch("id_to_display"))

    render("patient_templates/show.html.erb")
  end

  def new_form
    @patient = Patient.new

    render("patient_templates/new_form.html.erb")
  end

  def create_row
    @patient = Patient.new

    @patient.dob = params.fetch("dob")
    @patient.doctor_id = params.fetch("doctor_id")

    if @patient.valid?
      @patient.save

      redirect_back(:fallback_location => "/patients", :notice => "Patient created successfully.")
    else
      render("patient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @patient = Patient.find(params.fetch("prefill_with_id"))

    render("patient_templates/edit_form.html.erb")
  end

  def update_row
    @patient = Patient.find(params.fetch("id_to_modify"))

    @patient.dob = params.fetch("dob")
    @patient.doctor_id = params.fetch("doctor_id")

    if @patient.valid?
      @patient.save

      redirect_to("/patients/#{@patient.id}", :notice => "Patient updated successfully.")
    else
      render("patient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @patient = Patient.find(params.fetch("id_to_remove"))

    @patient.destroy

    redirect_to("/patients", :notice => "Patient deleted successfully.")
  end
end
