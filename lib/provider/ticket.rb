module TicketMaster::Provider
  module Assembla
    # Ticket class for ticketmaster-assembla
    #
    
    class Ticket < TicketMaster::Provider::Base::Ticket
      API = AssemblaAPI::Ticket # The class to access the api's tickets
      # declare needed overloaded methods here
      def title
        self.summary
      end
      
      def created_on
        @created_on ||= self[:created_on] ? Time.parse(self[:created_on]) : nil
      end
      
      def updated_at
        @updated_at ||= self[:updated_at] ? Time.parse(self[:updated_at]) : nil
      end
      
      def project_id
        self.prefix_options[:space_id]
      end
      
    end
  end
end
