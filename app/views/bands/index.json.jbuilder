json.array!(@bands) do |band|
  json.extract! band, :id, :code
  json.url band_url(band, format: :json)
end
