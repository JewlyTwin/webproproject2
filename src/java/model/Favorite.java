/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author earnnchp
 */
@Entity
@Table(name = "FAVORITE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Favorite.findAll", query = "SELECT f FROM Favorite f")
    , @NamedQuery(name = "Favorite.findByFavid", query = "SELECT f FROM Favorite f WHERE f.favid = :favid")
})
public class Favorite implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "FAVID")
    private Integer favid;
    @JoinColumn(name = "USERNAME", referencedColumnName = "USERNAME")
    @ManyToOne
    private Customer username;
    @JoinColumn(name = "PRODUCTID", referencedColumnName = "PRODUCTID")
    @ManyToOne
    private Product productid;

    public Favorite() {
    }

    public Favorite(Integer favid) {
        this.favid = favid;
    }

    public Integer getFavid() {
        return favid;
    }

    public void setFavid(Integer favid) {
        this.favid = favid;
    }

    public Customer getUsername() {
        return username;
    }

    public void setUsername(Customer username) {
        this.username = username;
    }

    public Product getProductid() {
        return productid;
    }

    public void setProductid(Product productid) {
        this.productid = productid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (favid != null ? favid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Favorite)) {
            return false;
        }
        Favorite other = (Favorite) object;
        if ((this.favid == null && other.favid != null) || (this.favid != null && !this.favid.equals(other.favid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Favorite[ favid=" + favid + " ]";
    }
    
}
