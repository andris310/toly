json.array!(@orders) do |order|
  json.extract! order, :first_name, :last_name, :address, :city, :state, :zipcode, :email, :pay_type
  json.url order_url(order, format: :json)
end
