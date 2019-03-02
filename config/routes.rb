Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#home'

  %w(home about meetings calendar resources contact).each do |route|
    get "/#{route}", to: "home##{route}"
  end
  post '/addresses', to: 'home#addresses'   # on contact page

  get '/docs/:id', to: 'docs#show', as: 'doc'

  get '/:str', to: proc { [404, {}, ['']] }, constraints: { str: /apple-touch-.*/}
end
