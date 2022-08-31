class BakedGood < ActiveRecord::Base
  # add association macro here
  belongs_to :bakery 

  def self.by_price
    self.all.order(price: :desc)
  end
  
  # def self.most_expensive
  #   maximum_price = self.all.maximum(:price)
  #   most_expensive_good = self.all.find_by(price: maximum_price)
  # end
end
