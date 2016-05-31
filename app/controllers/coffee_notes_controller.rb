class CoffeeNotesController < ApplicationController
  before_action :set_coffee_note, only: [:show, :edit, :update, :destroy]

  def index
    @coffee_notes = CoffeeNote.order(date: :desc)
  end

  def show
  end

  def new
    @coffee_note_form = CoffeeNoteForm.new
  end

  def edit
    @coffee_note_form = CoffeeNoteForm.populate_edit_form(@coffee_note)
  end

  def create
    @coffee_note_form = CoffeeNoteForm.new(coffee_note_params)
      if @coffee_note_form.save_form(params[:coffee_note_form])
        redirect_to coffee_notes_path, notice: 'Coffee note was successfully created.'
      else
        render :new
      end
  end

  def update
    @coffee_note_form = CoffeeNoteForm.populate_edit_form(@coffee_note)
    if @coffee_note_form.update_form(coffee_note_params)
      redirect_to coffee_notes_path, notice: 'Coffee note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @coffee_note.destroy
    respond_to do |format|
      format.html { redirect_to coffee_notes_url, notice: 'Coffee note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_coffee_note
      @coffee_note = CoffeeNote.find(params[:id])
    end

    def coffee_note_params
      params.require(:coffee_note).permit(:date, :coffee_type, :rating, :notes, :coffee_note_form)
    end
end