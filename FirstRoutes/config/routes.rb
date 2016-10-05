FirstRoutes::Application.routes.draw do

  # Let's add a new, nested resource, /users/:user_id/contacts,
  # so that we can get the contacts for a given user. We'll only need the
  # index action for this nested resource.

  #You may remove the index action from the top-level contacts resource.
  resources :users, :only => [:create, :destroy, :index, :show, :update] do
    resources :contacts, :only => [:index]
  end

  resources :contacts, :only => [:create, :destroy, :show, :update]
  resources :contact_shares, :only => [:create, :destroy]

  resources :contacts do
    post "favorite" => "contacts#favorite"
  end

  resources :contact_shares do
    post "favorite" => "contact_shares#favorite"
  end

  # Use a nice custom route to accomplish this. Hint: http://guides.rubyonrails.org/v3.2.14/routing.html#adding-more-restful-actions
end
