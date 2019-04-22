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

    def self.update(gossip, delete_index)
        
      gossips.delete_at(delete_index-1)
        
        #CSV.open(@@csv,"w") do |csv|
         
          #csv = ""
        #end
        #gossips.each {
          #|gossip|
          #gossip.save
        #}
    end 


end
