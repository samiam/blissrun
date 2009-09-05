class DocsController < ActionController::Base
  layout 'docs'
  DOCS = %w(five_mindfulness_trainings
            14_mindfulness_trainings
            five_remembrances
            concepts)

  def show
    if DOCS.include?( params[:doc] )
      render :file => "/docs/#{params[:doc]}", :layout => false
    else
      flash[:error] = "No such document: #{params[:doc]}"
      redirect_to root_url
    end
  end
end
