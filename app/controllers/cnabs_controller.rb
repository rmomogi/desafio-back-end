class CnabsController < ApplicationController
  
  def new
    @resource = Cnab.new
  end

  def create
    @cnab = Cnab.new(cnab_params)
    if @cnab.save
      CnabWorker.perform_async(@cnab.id)
      flash.now[:success] = t(:success_upload)
    else
      flash.now[:error] = @cnab.errors.full_messages.first
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def cnab_params
    params.require(:cnab).permit(:document)
  end
end
