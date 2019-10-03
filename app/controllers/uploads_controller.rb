class UploadsController < ApplicationController

  def index
    @documents = Cnab.all.order('created_at')
  end
end
