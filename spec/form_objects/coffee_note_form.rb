require 'spec_helper'

describe CoffeeNoteForm do
  def date
    (Time.zone.now - 2.days).to_s
  end

  def create_coffee_note_form
    @coffee_note = CoffeeNote.new(date: date,
                                  coffee_type: 'Flat White',
                                  rating: 5,
                                  notes: 'not bad')
    @coffee_note_form = CoffeeNoteForm.populate_edit_form(@coffee_note)
  end

  before(:each) do
    create_coffee_note_form
  end

  it 'pupulates the form with the correct values' do
    expect(@coffee_note_form.date).to eq(date)
    expect(@coffee_note_form.coffee_type).to eq('Flat White')
    expect(@coffee_note_form.rating).to eq(5)
    expect(@coffee_note_form.notes).to eq('not bad')
  end

end
