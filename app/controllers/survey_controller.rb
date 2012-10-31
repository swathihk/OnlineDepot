class SurveyController < ApplicationController
  def new
    @survey = Survey.new
    #1.times do
     @survey.build_book
      question = @survey.questions.build

      #2.times {}
      question.answers.build
    #end
  end
  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      flash[:notice] = "Successfully created survey."
      redirect_to user_signup_path
    else
      render :action => 'new'
    end
  end
end
