class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @question_day = QuestionDay.find_by(date: (Date.tomorrow.beginning_of_day..Date.tomorrow.end_of_day))
  end
end
