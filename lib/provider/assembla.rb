module TaskMapper::Provider
  # This is the Assembla Provider for taskmapper
  module Assembla
    include TaskMapper::Provider::Base
    TICKET_API = Assembla::Ticket # The class to access the api's tickets
    PROJECT_API = Assembla::Project # The class to access the api's projects
    
    # This is for cases when you want to instantiate using TaskMapper::Provider::Assembla.new(auth)
    def self.new(auth = {})
      TaskMapper.new(:assembla, auth)
    end
    
    # Providers must define an authorize method. This is used to initialize and set authentication
    # parameters to access the API
    def authorize(auth = {})
      @authentication ||= TaskMapper::Authenticator.new(auth)
      # Set authentication parameters for whatever you're using to access the API
      auth = @authentication
      if auth.username.blank? and auth.password.blank?
        raise "Please provide login and password"
      end
      ::AssemblaAPI.authenticate(auth.username, auth.password)
    end
    
    # declare needed overloaded methods here
    
  end
end
