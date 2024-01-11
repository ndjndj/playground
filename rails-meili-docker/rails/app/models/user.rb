class User < ApplicationRecord
  include MeiliSearch::Rails

  meilisearch do
    attribute :name, :name_ruby, :age, :pref, :pref_code, :tel, :url
  end
end

