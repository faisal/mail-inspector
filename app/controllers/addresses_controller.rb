class AddressesController < ApplicationController
  def index
    @addresses = Address.includes(:messages).all
  end
end
