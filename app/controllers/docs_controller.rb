class DocsController < ActionController::Base

  DOCS = %w(five_mindfulness_trainings
            14_mindfulness_trainings
            five_remembrances
            concepts)

  def show
    name = params[:doc]
    if DOCS.include?( name )
      render :file => "/docs/#{name}"
    else
      flash[:error] = "No such document: #{name}"
      redirect_to root_url
    end
  end
end
