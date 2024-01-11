class User < ApplicationRecord
  include MeiliSearch::Rails

  meilisearch do
    attribute :id, :uid, :name, :name_ruby, :url
  end
end
