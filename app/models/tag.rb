class Tag < ActiveRecord::Base
  has_ancestry
  attr_accessible :name, :parent_id
end
