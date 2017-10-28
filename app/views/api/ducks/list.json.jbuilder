json.array!(@ducks) do |duck|
  json.extract! duck, :postal_code, :password, :unique_id
end
