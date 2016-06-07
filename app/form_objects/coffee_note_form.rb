class CoffeeNoteForm
  include ActiveModel::Model

  def persisted?
    defined? @id
  end

  def set_attributes(attributes)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  attr_accessor :date, :coffee_type_note, :notes, :rating, :id, :size, :coffee_consumption_id

  def initialize(attributes={})
    @errors = ActiveModel::Errors.new(self)
    set_attributes(attributes)
  end

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
      coffee_note.build_coffee_consumption(coffee_consumption_params)
    end
  end

  def self.populate_edit_form(coffee_note, coffee_consumption)
    coffee_note_form = new(id: coffee_note.id,
                          date: coffee_note.date,
                          coffee_type_note: coffee_note.coffee_type,
                          rating: coffee_note.rating,
                          notes: coffee_note.notes,
                          size: coffee_consumption.size
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
      # coffee_type: coffee_type_note,
      rating: rating,
      notes: notes,
    }
  end

  def coffee_consumption_params
    { id: id,
      date: date,
      size: size
    }
  end

  def set_consumption(params)
    @set_consumption = CoffeeConsumption.find(id)
  end

end
