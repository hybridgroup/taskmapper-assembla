require 'rubygems'
require 'active_support'
require 'active_resource'

# Ruby lib for working with the Assembla API's XML interface.  
# You should set the authentication using your login
# credentials with HTTP Basic Authentication. 
#
#
# This library is a small wrapper around the REST interface.  

module AssemblaAPI
  class Error < StandardError; end
  class << self

    # Sets up basic authentication credentials for all the resources.
    def authenticate(username, password)
      @username    = username
      @password = password
      self::Base.user = username
      self::Base.password = password
    end

    def resources
      @resources ||= []
    end
  end
  
  class Base < ActiveResource::Base
    self.site = "http://www.assembla.com/"
    def self.inherited(base)
      AssemblaAPI.resources << base
      super
    end
  end

  class Project < Base
   self.site += 'spaces/my_spaces'
   #def tickets(options = {})
    #  Ticket.find(:all, :params => options.update(:space_id => id))
   #end
   def tickets(options = {})
      ProjectTicket.find(:all, :params => options.update(:space_id => id))
    end
  end

  class Ticket < Base
    self.site += 'spaces/:space_id'
  end   

  class ProjectTicket < Base
    self.site += 'spaces/:space_id'
    self.element_name = 'ticket'
  end
end
