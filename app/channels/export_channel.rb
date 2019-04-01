class ExportChannel < ApplicationCable::Channel

  def subscribed
    # Export id is sent from button click in web client
    stream_from "export_channel_#{params[:export_id]}"
  end

  def unsubscribed; end

end
