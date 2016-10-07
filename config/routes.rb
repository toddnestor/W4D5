Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts do
    post "upvote", to: "posts#upvote", as: "upvote"
    post "downvote", to: "posts#downvote", as: "downvote"
  end
  resources :comments, only: [:create, :show] do
    post "upvote", to: "comments#upvote", as: "upvote"
    post "downvote", to: "comments#downvote", as: "downvote"
  end
end
