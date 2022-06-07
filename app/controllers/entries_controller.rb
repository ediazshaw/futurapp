class EntriesController < ApplicationController
  def index
    @date_entries = current_user.entries.group_by { |x| x.created_at.strftime("%d-%b-%y") }
    @date_entries = @date_entries.each do |date, entries|
      current_user.entries.where(remember_date:(Date.parse(date).beginning_of_day..Date.parse(date).end_of_day)).map {|e| entries << e }
    end
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    if @entry.save
      redirect_to entries_path(anchor: 'go-today')
    else
      render "pages/home"
    end
  end

  def search
    @categories = Category.all
    @entries = current_user.entries
    if params[:query].present?
      @entries = @entries.search(params[:query])
    end
    if params[:categories].present?
      @entries = @entries.joins(:category).where(category: { category: params[:categories] })
    end
    if params[:question_day].present?
      @entries = @entries.where(question_day: true)
    end
    if params[:start_date].present? && params[:end_date].present?
      @entries = @entries.where(created_at: params[:start_date]..params[:end_date]).or(@entries.where(remember_date: params[:start_date]..params[:end_date]))
    end
  end

  def show
    @category_entries = current_user.entries.where(created_at:(Date.parse(params[:id]).beginning_of_day..Date.parse(params[:id]).end_of_day)).group_by(&:category_id)
    @category_entries[:predicted_entries] = current_user.entries.where(remember_date: (Date.parse(params[:id]).beginning_of_day..Date.parse(params[:id]).end_of_day))
  end

  def forum
    @entries = Entry.all
    @entries_public = Entry.where(private:false)
  end

  def forum_show
    # @theme = Entry.find(params[:theme])
    @review = Review.new
    @entries_with_theme = Entry.where(theme: params[:id])
    @reviews = Review.all
  end

  private

  def entry_params
    params.require(:entry).permit(:theme, :comment, :remember_date, :question_day, :created_at, :category_id, photos: [])
  end
end
