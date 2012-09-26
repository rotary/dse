Dse::Application.routes.draw do
  resources :folders, :only => [:new, :create] do
    collection do
      post :upload
    end
  end
  root :to => "folders#index"
end
