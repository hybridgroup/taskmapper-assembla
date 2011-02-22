require 'rubygems'
require 'active_support'
require 'active_resource'

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
  end

  class Ticket < Base
    self.site += 'spaces/:space_id/'
  end

  class Comment < Base
    self.site += '/spaces/:space_id/tickets/:ticket_number'
  end

end
