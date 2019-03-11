def consolidate_cart(cart)
  new_hash = {};
  count = 0;
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
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
