Refinery::Core::Engine.routes.append do

  # Frontend routes
  # namespace :shinetech, path: '' do
  #   get '/clients(/:id)' => 'clients#index'
  # end

  # Admin routes
  namespace :shinetech, path: '' do
    namespace :admin, path: 'refinery/shinetech' do
      resources :clients, except: :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
