def consolidate_cart(cart)
  new_hash = {}
  cart.each do |item|
    item.each do |name, info|
      if new_hash[name].nil?
        new_hash[name] = info.merge({:count => 1})
      else
        new_hash[name][:count] += 1
      end
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  new_hash = {}
  cart.each do |name, info|
    coupons.each do |coupon, item|
      if name == coupon[:item] && info[:count] >= coupon[:num]
        info[count] = info[:count] - coupon[:num]
      if new_hash[`#{name} W/COUPON`]
        new_hash[`#{name} W/COUPON`][:count] += 1
      else
        new_hash[`#{name} W/COUPON`] = {:price => coupon[:cost], [:clearance] => info[:clearance], :count => 1}
      end
    end
  end
  new_hash[name] = info
end
new_hash
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
