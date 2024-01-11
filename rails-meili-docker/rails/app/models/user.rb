class User < ApplicationRecord
  include MeiliSearch::Rails
  meilisaerch primary_key: :uid
  
  meilisearch do
    attribute :id, :uid, :name, :name_ruby, :url
  end
end
