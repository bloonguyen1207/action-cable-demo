require 'csv'

class ExportCommand
  def self.call
    sleep 10

    file = CSV.generate do |csv|
      (1..15_000).each do |_i|
        csv << %w[data1 data2 data3 data4 data5 data6 data7]
      end
    end

    file
  end
end
