/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author James
 */
public class ItemsinCart implements Serializable {

    private Product product;
    private int salePrice;
    private int quantity;

    public ItemsinCart() {
    }

    public ItemsinCart(Product product) {
        this(product, 1);
    }

    public ItemsinCart(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
        this.salePrice = product.getUnitprice();
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalPrice() {
    return quantity * salePrice;
    }

}