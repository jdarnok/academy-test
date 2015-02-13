class City < ActiveRecord::Base
  before_validation :make_short_name, on: [:create, :update]
  validates :name, uniqueness: true, presence: true
  validates_presence_of :short_name


  protected
  def make_short_name
    if self.name.length > 1
      chars = []
      chars << self.name.chars.first
      chars << self.name.chars.last
      self.short_name = chars.join
    else
      self.short_name = self.name.chars.first
    end
  end

end
