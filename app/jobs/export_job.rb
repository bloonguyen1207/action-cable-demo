class ExportJob < ApplicationJob
  queue_as :default

  def perform(export_id)
    return if export_id.blank?

    csv_content = ExportCommand.call

    ActionCable.server.broadcast(
      "export_channel_#{export_id}",
      csv_file: {
        file_name: 'data.csv',
        content: csv_content
      }
    )
  end
end
