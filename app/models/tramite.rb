class Tramite < ActiveRecord::Base

	belongs_to :user
  belongs_to :tramitable, polymorphic: true
end
