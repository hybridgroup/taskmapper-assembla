module TaskMapper::Provider
  module Assembla
    # The comment class for taskmapper-assembla
    #
    # Do any mapping between Ticketmaster and your system's comment model here
    # versions of the ticket.
    #
    class Comment < TaskMapper::Provider::Base::Comment
      #API = AssemblaAPI::Comment # The class to access the api's comments
      # declare needed overloaded methods here
      def created_at
        @created_at ||= self[:created_at] ? Time.parse(self[:created_at]) : nil
      end
      
      def updated_at
        @updated_at ||= self[:updated_at] ? Time.parse(self[:updated_at]) : nil
      end
      
      def project_id
        self.prefix_options[:project_id]
      end
      
      def ticket_id
        self.prefix_options[:ticket_id]
      end
    end
  end
end
