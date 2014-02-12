class Service < ActiveRecord::Base
belongs_to :provider
belongs_to :user
  
validates_presence_of :type
end
