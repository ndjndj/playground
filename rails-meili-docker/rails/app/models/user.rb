class User < ApplicationRecord
  include MeiliSearch::Rails

  meilisearch primary_key: :id

  meilisearch do
    attribute :id, :name, :name_ruby, :url
  end
end
