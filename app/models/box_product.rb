class BoxProduct < ActiveRecord::Base
  belongs_to :box
  belongs_to :product
end
