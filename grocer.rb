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
    coupons.each do |coupon|
        if name == coupon[:item] && info[:count] >= coupon[:num]
          info[:count] = info[:count] - coupon[:num]
        if new_hash["#{name} W/COUPON"]
          new_hash["#{name} W/COUPON"][:count] += 1
        else
          new_hash["#{name} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
          end
        end
      end
  new_hash[name] = info
end
new_hash
end

def apply_clearance(cart)
  new_hash = {}
  cart.each do |item, info|
    new_hash[item] = {}
      if info[:clearance] == true
        new_hash[item][:price] = info[:price] - (info[:price] * 0.2)
      else
        new_hash[item][:price] = info[:price]
      end
        new_hash[item][:clearance] = info[:clearance]
        new_hash[item][:count] = info[:count]
      end
    new_hash
end

def checkout(cart, coupons)
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  result = 0
  cart.each do |item, info|
    result += info[:price] * info[:count]
  end
  if result > 100
    result = result * 0.9
  end
    result
end
