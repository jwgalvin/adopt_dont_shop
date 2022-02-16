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
    redirect_to "/admin/applications/#{@app.id}"
  end
  private
    def app_params
      params.permit(
        :status
      )
    end
end
