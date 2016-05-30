class CoffeeNoteForm
  include ActiveModel::Model

  def persisted?
    defined? @id
  end

  attr_accessor :date, :coffee_type, :notes, :rating, :id

  def save_form(params)
    return false unless valid?
    CoffeeNote.create!(coffee_note_params)
  end

  def update_form(params)
    CoffeeNote.update(coffee_note_params)
  end

  def self.populate_edit_form(coffee_note)
    coffee_note_form = new(id: coffee_note.id,
                          date: coffee_note.date,
                          coffee_type: coffee_note.coffee_type,
                          rating: coffee_note.rating,
                          notes: coffee_note.notes
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
      coffee_type: coffee_type,
      rating: rating,
      notes: notes,
    }
  end

end
