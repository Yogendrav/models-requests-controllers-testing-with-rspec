class Restaurant < ActiveRecord::Base
   attr_accessible  :name, :address, :address2, :phone , :zip_code, :website,:point1_name,:point1_email, :point1_mobile,:point2_name,:point2_email, :point2_mobile, :description
 
  validates_presence_of :point1_email
  has_many :meals
  
  belongs_to :cuisine
  belongs_to :admin, :foreign_key => "sales_owner_id"
  belongs_to :cluster

  belongs_to :city


#  validates_presence_of :name, :address, :address2, :phone , :zip_code, :website,:point1_name,:point1_email, :point1_mobile, :description
#  validates_numericality_of :phone, :only_integer => true, :message => "accepts only Integer values"
#  validates_numericality_of :zip_code, :point1_mobile, :only_integer => true, :message => "accepts only Integer values"
#  validates_uniqueness_of :name,  :presence => true
#  validates_format_of :point1_email,:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email format"

#def initialize(params = nil)
#  super {}
#  self.name = ''
#  self.description = ''
#  self.lat = 0.0
#  self.lng = 0.0
#  self.admin_id = 4
#  self.city_id = 0
#  self.status = 1
#  self.cuisine_id = 0
#  self.cluster_id = 0
#  self.phone = ''
#  self.url = ''
#  self.address = ''
#  self.your_name = ''
#  self.owner_id = 0
#  self.email = ''
#  self.address2 = ''
#  self.zip_code = ''
#  self.website = ''
#  self.delivery_name = ''
#  self.delivery_staff = ''
#  self.order_day = ''
#  self.primary_cusine = ''
#  self.combo_meals = 0
#
#
#  self.attributes = params
#
#end




  # had GPS coordinates defined
  def coords?
    return !(self.lat.to_f.eql?(0.0) && self.lng.to_f.eql?(0.0))
  end

  # if it has a delivery area defined
  def delivery_area?
    return !self.delivery_area.to_s.empty?
  end

  def approved?
    return self.status.eql?(1)
  end

end
