class CoffeeNoteForm < BaseForm
  include ActiveModel::Model

  attr_accessor :date, :coffee_type_id, :notes, :rating, :id, :size, :coffee_consumption_id, :caffine_in_mg

  # validates :coffee_consumption_id, presence: true
  validates :date, presence: true

  def self.model_name
    ActiveModel::Name.new(CoffeeNote)
  end

  def save_form(params)
    return false unless valid?
    CoffeeNote.transaction do
      coffee_note = CoffeeNote.new(coffee_note_params)
      coffee_note.build_coffee_consumption(coffee_consumption_params)
      coffee_note.save!
    end
  end

  def update_form(params)
    set_attributes(params)
    CoffeeNote.transaction do
      coffee_note = CoffeeNote.find(id)
      coffee_note.update_attributes!(coffee_note_params)
      consumption = coffee_note.coffee_consumption
      consumption.update_attributes!(coffee_consumption_params)
    end
  end

  def self.populate_edit_form(coffee_note, coffee_consumption)
    coffee_note_form = new(id: coffee_note.id,
                          date: coffee_note.date,
                          coffee_type_id: coffee_note.coffee_type_id,
                          rating: coffee_note.rating,
                          notes: coffee_note.notes,
                          size: coffee_note.coffee_consumption.size,
                          )
  end

  def date=(date)
    if date.is_a?(String)
      @date = Time.zone.parse(date)
    else
      @date = date
    end
  end

  private

  def coffee_note_params
    { id: id,
      date: date,
      coffee_type_id: coffee_type_id,
      rating: rating,
      notes: notes,
    }
  end

  def coffee_consumption_params
    caffine_in_mg = CoffeeConsumptionCalculator.new.calculate_caffine(size)
    { date: date,
      size: size,
      caffine_in_mg: caffine_in_mg
    }
  end

  def set_consumption(params)
    @set_consumption = CoffeeConsumption.find(id)
  end

end
