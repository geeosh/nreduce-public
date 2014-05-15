if Rails.env.production? && ENV['WEBSOLR_URL'].present?
  Sunspot.config.solr.url = ENV['WEBSOLR_URL']
end