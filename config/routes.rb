Rails.application.routes.draw do
  post 'callback', to: 'collaboration_callbacks#confirm_url'
  delete 'callback', to: 'collaboration_callbacks#confirm_url'

  root to: 'guide#home'

  get 'xml_config', to: 'guide#xml_config', as: :xml_config
  get 'xml_builder', to: 'guide#xml_builder', as: :xml_builder

  resources :tool_proxy, only: [:create]

  post 'messages/blti', to: 'message#basic_lti_launch_request', as: 'blti_launch'
  get 'recordrtc', to: 'recordrtc#index', as: 'recordrtc_index'
  post 'recordrtc', to: 'message#recordrtc_launch_request', as: 'recordrtc_launch'
  post 'messages/content-item', to: 'message#content_item_selection', as: 'content_item_request_launch'
  post 'messages/content-item', to: 'message#basic_lti_launch_request', as: 'content_item_launch'
  post 'messages/signed_content_item_request', to: 'message#signed_content_item_request'
  post 'messages/youtube', to: 'message#youtube', as: 'youtube'

  post 'register', to: 'registration#register', as: :tool_registration
  post 'reregister', to: 'registration#register', as: :tool_reregistration
  post 'submit_capabilities', to: 'registration#save_capabilities', as: 'save_capabilities'
  get 'submit_proxy/:registration_uuid', to: 'registration#submit_proxy', as: 'submit_proxy'

  mount RailsLti2Provider::Engine => '/rails_lti2_provider'

  namespace :api, defaults: {format: :json} do
    resources :recordings, except: [:new, :edit]
  end

  resources :recordrtc, only: [:index, :show, :new, :edit]

  get 'refresh_recordings', to: 'recordrtc#refresh_recordings'
end
