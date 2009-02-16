require 'rubygems'
require 'activeresource'
module Radiant
  module API
    module Version
      MAJOR = '0'
      MINOR = '7'
      TINY  = '1'
      def self.to_s
        "#{MAJOR}.#{MINOR}.#{TINY}"
      end
    end
    
    class << self
      def site=(url)
        RESOURCES.each do |klass|
          klass.site = url
        end
      end
      
      def user=(user)
        RESOURCES.each do |klass|
          klass.user = user
        end
      end
      
      def password=(pass)
        RESOURCES.each do |klass|
          klass.password = pass
        end
      end
    end
    
    class Page < ActiveResource::Base; end
    class PagePart < ActiveResource::Base; end
    class User < ActiveResource::Base; end
    class Layout < ActiveResource::Base; end
    class Snippet < ActiveResource::Base; end
    
    RESOURCES = [Page, PagePart, User, Layout, Snippet]
  end
end