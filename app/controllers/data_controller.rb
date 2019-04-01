class DataController < ApplicationController

  def index; end

  def export
    ExportJob.perform_later(params[:export_id])
    head :accepted
  end

end
