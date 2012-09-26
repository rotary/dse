Dse::Application.routes.draw do
  resource :folder, :only => [:new, :create] do
    member do
      post :upload
    end
  end
  root :to => "folders#index"
end
