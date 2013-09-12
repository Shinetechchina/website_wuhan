Refinery::Core::Engine.routes.append do
  namespace :staffs, :path => '' do
    # get '/staff(/:id)' => 'staffs#index'

    resources :staffs, :path => '', :only => [] do
      member do
        get :details
      end
    end

    namespace :admin, :path => 'refinery' do
      resources :staffs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end
end
