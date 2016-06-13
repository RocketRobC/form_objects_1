class CoffeeConsumption < ActiveRecord::Base

  belongs_to :coffee_type
  has_one :coffee_note, dependent: :destroy

  enum size: [:half, :single, :double, :triple]


  def self.last_7_days
    where(date: ((Time.now - 7.days)..Time.now))
  end

  def self.consumed_caffine
    pluck(:caffine_in_mg).sum
  end

end
