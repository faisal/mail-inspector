class AddressesController < ApplicationController
  # GET /addresses
  def index
    @addresses = Address.includes(:messages).all
  end
end
