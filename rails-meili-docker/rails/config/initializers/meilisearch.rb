MeiliSearch::Rails.configuration = {
  meilisearch_url: ENV.fetch('MEILISEARCH_HOST', 'http://meilisearch:7700'), meilisearch_api_key: ENV.fetch('MEILISEARCH_API_KEY', 'meili-master-key')
}
