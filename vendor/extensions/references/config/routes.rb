Refinery::Core::Engine.routes.append do
  namespace :references, :path => '' do
    get '/references' => 'references#index'

    namespace :admin, :path => 'refinery' do
      resources :references, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end
end
