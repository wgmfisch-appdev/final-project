Rails.application.routes.draw do
  root 'patients#index'
  
  # Routes for the Favorite compound resource:

  # CREATE
  get("/favorite_compounds/new", { :controller => "favorite_compounds", :action => "new_form" })
  post("/create_favorite_compound", { :controller => "favorite_compounds", :action => "create_row" })

  # READ
  get("/favorite_compounds", { :controller => "favorite_compounds", :action => "index" })
  get("/favorite_compounds/:id_to_display", { :controller => "favorite_compounds", :action => "show" })

  # UPDATE
  get("/favorite_compounds/:prefill_with_id/edit", { :controller => "favorite_compounds", :action => "edit_form" })
  post("/update_favorite_compound/:id_to_modify", { :controller => "favorite_compounds", :action => "update_row" })

  # DELETE
  get("/delete_favorite_compound/:id_to_remove", { :controller => "favorite_compounds", :action => "destroy_row" })

  #------------------------------

  # Routes for the Pharmacy resource:

  # CREATE
  get("/pharmacies/new", { :controller => "pharmacies", :action => "new_form" })
  post("/create_pharmacy", { :controller => "pharmacies", :action => "create_row" })

  # READ
  get("/pharmacies", { :controller => "pharmacies", :action => "index" })
  get("/pharmacies/:id_to_display", { :controller => "pharmacies", :action => "show" })

  # UPDATE
  get("/pharmacies/:prefill_with_id/edit", { :controller => "pharmacies", :action => "edit_form" })
  post("/update_pharmacy/:id_to_modify", { :controller => "pharmacies", :action => "update_row" })

  # DELETE
  get("/delete_pharmacy/:id_to_remove", { :controller => "pharmacies", :action => "destroy_row" })

  #------------------------------

  # Routes for the Concentration resource:

  # CREATE
  get("/concentrations/new", { :controller => "concentrations", :action => "new_form" })
  post("/create_concentration", { :controller => "concentrations", :action => "create_row" })

  # READ
  get("/concentrations", { :controller => "concentrations", :action => "index" })
  get("/concentrations/:id_to_display", { :controller => "concentrations", :action => "show" })

  # UPDATE
  get("/concentrations/:prefill_with_id/edit", { :controller => "concentrations", :action => "edit_form" })
  post("/update_concentration/:id_to_modify", { :controller => "concentrations", :action => "update_row" })

  # DELETE
  get("/delete_concentration/:id_to_remove", { :controller => "concentrations", :action => "destroy_row" })

  #------------------------------

  # Routes for the Ingredient resource:

  # CREATE
  get("/ingredients/new", { :controller => "ingredients", :action => "new_form" })
  post("/create_ingredient", { :controller => "ingredients", :action => "create_row" })

  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })
  get("/ingredients/:id_to_display", { :controller => "ingredients", :action => "show" })

  # UPDATE
  get("/ingredients/:prefill_with_id/edit", { :controller => "ingredients", :action => "edit_form" })
  post("/update_ingredient/:id_to_modify", { :controller => "ingredients", :action => "update_row" })

  # DELETE
  get("/delete_ingredient/:id_to_remove", { :controller => "ingredients", :action => "destroy_row" })

  #------------------------------

  # Routes for the Compound resource:

  # CREATE
  get("/compounds/new", { :controller => "compounds", :action => "new_form" })
  post("/create_compound", { :controller => "compounds", :action => "create_row" })

  # READ
  get("/compounds", { :controller => "compounds", :action => "index" })
  get("/compounds/:id_to_display", { :controller => "compounds", :action => "show" })

  # UPDATE
  get("/compounds/:prefill_with_id/edit", { :controller => "compounds", :action => "edit_form" })
  post("/update_compound/:id_to_modify", { :controller => "compounds", :action => "update_row" })

  # DELETE
  get("/delete_compound/:id_to_remove", { :controller => "compounds", :action => "destroy_row" })

  #------------------------------

  # Routes for the Patient resource:

  # CREATE
  get("/patients/new", { :controller => "patients", :action => "new_form" })
  post("/create_patient", { :controller => "patients", :action => "create_row" })

  # READ
  get("/patients", { :controller => "patients", :action => "index" })
  get("/patients/:id_to_display", { :controller => "patients", :action => "show" })

  # UPDATE
  get("/patients/:prefill_with_id/edit", { :controller => "patients", :action => "edit_form" })
  post("/update_patient/:id_to_modify", { :controller => "patients", :action => "update_row" })

  # DELETE
  get("/delete_patient/:id_to_remove", { :controller => "patients", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
