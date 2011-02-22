module TicketMaster::Provider
  module Assembla
    # The comment class for ticketmaster-assembla
    #
    # Do any mapping between Ticketmaster and your system's comment model here
    # versions of the ticket.
    #
    class Comment < TicketMaster::Provider::Base::Comment
      API = AssemblaAPI::Comment # The class to access the api's comments
      # declare needed overloaded methods here
      def created_at
        begin
          Time.parse(self[:created_on])
        rescue
          self[:created_on]
        end
      end
      
      def updated_at
        begin
          Time.parse(self[:updated_at])
        rescue
          self[:updated_at]
        end
      end
      
      def project_id
        self.prefix_options[:space_id]
      end
      
      def ticket_number
        self.prefix_options[:ticket_number]
      end
    end
  end
end
