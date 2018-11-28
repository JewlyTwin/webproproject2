package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author James
 */
public class Cart implements Serializable {

    private Map<Integer, ItemsinCart> cart;

    public Cart() {
        cart = new HashMap();
    }

    public void add(Product p) {
        ItemsinCart items = cart.get(p.getProductid());
        if (items == null) {
            cart.put(p.getProductid(), new ItemsinCart(p));
        } else {
            items.setQuantity(items.getQuantity() + 1);
        }
    }

    public void remove(Product p) {
    ItemsinCart items = cart.get(p.getProductid());
    items.setQuantity(items.getQuantity() - 1);
        if (items.getQuantity() == 0) {
            this.remove(p.getProductid());
        }
        
        
    }

    public void remove(int getProductid) {
        
        cart.remove(getProductid);

    }

    public int getTotalPrice() {
        int sum = 0;
        Collection<ItemsinCart> itemInCarts = cart.values();
        for (ItemsinCart itemInCart : itemInCarts) {
            sum += itemInCart.getTotalPrice();
        }
        return sum;
    }

    public int getTotalQuantity() {
        int sum = 0;
        Collection<ItemsinCart> itemInCarts = cart.values();
        for (ItemsinCart itemInCart : itemInCarts) {
            sum += itemInCart.getQuantity();
        }
        return sum;
    }

    public List<ItemsinCart> getitemsInCart() {
        return new ArrayList(cart.values());
    }
}
