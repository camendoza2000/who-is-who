json.array!(@wellcomes) do |wellcome|
  json.extract! wellcome, :id
  json.url wellcome_url(wellcome, format: :json)
end
