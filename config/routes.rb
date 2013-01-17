MailIntel::Application.routes.draw do
  resources :addresses
  resources :attachments
  resources :mailboxes
  resources :messages
  resources :properties
  resources :recipients
  resources :subjects

  root :to => 'welcome#index'
end
