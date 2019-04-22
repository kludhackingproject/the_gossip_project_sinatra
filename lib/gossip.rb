require 'pry'
require 'csv'

class Gossip

    attr_accessor :author, :content, :all_gossips

    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
    end

    def self.all
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
      return all_gossips
    end

    def self.find(id)
      id = id.to_i
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
      return all_gossips[id]
    end

    def self.update(delete_index)
      # all_gossips = []
      # delete_index = delete_index.to_i
      #
      # CSV.open("./db/gossip.csv").each do |csv_line|
      #     all_gossips << Gossip.new(csv_line[0], csv_line[1])
      #     all_gossips.delete(delete_index)
      # end
      #


      table = CSV.open("./db/gossip.csv", 'w')

      table.delete_if do |row|
        row[delete_index] == true
      end
    end

end
