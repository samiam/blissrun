class DocsController < ApplicationController

  DOCS = %w(five_mindfulness_trainings
            14_mindfulness_trainings
            five_remembrances
            concepts)

  def show
    @page_title = 'Documentation'

    name = params[:id]
    if DOCS.include?(name)
      render :file => "/docs/#{name}"
    else
      flash[:error] = "No such document: #{name}"
      redirect_to resources_url
    end
  end
end
