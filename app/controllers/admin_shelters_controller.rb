class AdminSheltersController < ApplicationController
  def index
    @admshelters = Shelter.reverse_order
    @pendingadoptions = Shelter.pending_applications
  end

  def show
    @app = Application.find(params[:id])

  end

  def update
    @app = Application.find(params[:id])
    @pet_app = @app.pet_applications

    @pet_app.first.update(app_params)

    #@pet_app.save
    #binding.pry
    #@pet = Pet.find(pet_app.pet_id).name
    #@pet.update(pet_params)
    redirect_to "/admin/applications/#{@app.id}"
  end

  # def find_pet_app(pet_id)
  #   @pet_app = PetApplication.find(params[:pet_id])
  # end

  private
    def app_params
      params.permit(
        :status
      )
    end
end
