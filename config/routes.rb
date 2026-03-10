Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get  "registration", to: "registrations#new",    as: :new_registration
  post "registration", to: "registrations#create", as: :registrations

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "homepage#show"

  constraints lambda { |req| !req.xhr? && req.format.html? && (req.path =~ %r{^/(rails|assets)/}).nil? } do
    get "*path" => "cms/pages#index", as: :cms_page
  end
end
