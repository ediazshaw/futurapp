class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    if @entry.save
      redirect_to entries_path
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
    if params[:search_date].present?
      @entries = @entries.where(created_at: params[:search_date])
    end
    if params[:remember_date].present?
      @entries = @entries.where(remember_date: params[:remember_date])
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:theme, :comment, :remember_date, :question_day, :created_at, :photo, :category_id)
  end
end
