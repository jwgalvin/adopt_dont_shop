class AdminSheltersController < ApplicationController
  def index
    @admshelters = Shelter.reverse_order
  end
end
