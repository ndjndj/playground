class User < ActiveRecord::Base
  include MeiliSearch::Rails

  meilisearch do
    attribute :id, :name, :name_ruby, :age, :pref, :pref_code, :tel, :url
  end
end
