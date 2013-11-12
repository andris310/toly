json.array!(@coupons) do |coupon|
  json.extract! coupon, :coupon_code, :times_used
  json.url coupon_url(coupon, format: :json)
end
