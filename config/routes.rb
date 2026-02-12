Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Auth
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Setup wizard
  resource :setup, only: [:show, :update], controller: "setup" do
    member do
      get :basics       # Step 1: Name, location
      patch :basics, action: :update_basics
      get :officials    # Step 2: Officials
      patch :officials, action: :update_officials
      get :services     # Step 3: Services
      patch :services, action: :update_services
      get :contact      # Step 4: Contact info
      patch :contact, action: :update_contact
      get :preview      # Step 5: Preview & publish
      patch :publish, action: :do_publish
    end
  end

  # Admin dashboard
  namespace :admin do
    root to: "dashboard#index"
    resource :site, only: [:edit, :update]
    resources :officials, except: [:show]
    resources :services, except: [:show]
    resources :announcements
    resources :pages
  end

  # Public site view (by slug)
  get "sites/:slug", to: "public_sites#show", as: :public_site
  get "sites/:slug/services", to: "public_sites#services", as: :public_site_services
  get "sites/:slug/officials", to: "public_sites#officials", as: :public_site_officials
  get "sites/:slug/transparency", to: "public_sites#transparency", as: :public_site_transparency
  get "sites/:slug/announcements", to: "public_sites#announcements", as: :public_site_announcements
  get "sites/:slug/contact", to: "public_sites#contact", as: :public_site_contact

  # Landing page
  root "home#index"
end
