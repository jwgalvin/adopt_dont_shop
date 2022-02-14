class AdminSheltersController < ApplicationController
  def index
    @admshelters = Shelter.reverse_order
    @pendingadoptions = Shelter.pending_applications
  end
end
