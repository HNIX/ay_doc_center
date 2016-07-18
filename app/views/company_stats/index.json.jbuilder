json.array!(@company_stats) do |company_stat|
  json.extract! company_stat, :id, :name, :stat, :desc, :type
  json.url company_stat_url(company_stat, format: :json)
end
