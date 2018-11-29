/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.controller;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.Favorite;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import model.Orderdetail;
import model.Product;
import model.controller.exceptions.NonexistentEntityException;
import model.controller.exceptions.RollbackFailureException;

/**
 *
 * @author earnnchp
 */
public class ProductJpaController implements Serializable {

    public ProductJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Product product) throws RollbackFailureException, Exception {
        if (product.getFavoriteList() == null) {
            product.setFavoriteList(new ArrayList<Favorite>());
        }
        if (product.getOrderdetailList() == null) {
            product.setOrderdetailList(new ArrayList<Orderdetail>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Favorite> attachedFavoriteList = new ArrayList<Favorite>();
            for (Favorite favoriteListFavoriteToAttach : product.getFavoriteList()) {
                favoriteListFavoriteToAttach = em.getReference(favoriteListFavoriteToAttach.getClass(), favoriteListFavoriteToAttach.getFavid());
                attachedFavoriteList.add(favoriteListFavoriteToAttach);
            }
            product.setFavoriteList(attachedFavoriteList);
            List<Orderdetail> attachedOrderdetailList = new ArrayList<Orderdetail>();
            for (Orderdetail orderdetailListOrderdetailToAttach : product.getOrderdetailList()) {
                orderdetailListOrderdetailToAttach = em.getReference(orderdetailListOrderdetailToAttach.getClass(), orderdetailListOrderdetailToAttach.getOrderdetailid());
                attachedOrderdetailList.add(orderdetailListOrderdetailToAttach);
            }
            product.setOrderdetailList(attachedOrderdetailList);
            em.persist(product);
            for (Favorite favoriteListFavorite : product.getFavoriteList()) {
                Product oldProductidOfFavoriteListFavorite = favoriteListFavorite.getProductid();
                favoriteListFavorite.setProductid(product);
                favoriteListFavorite = em.merge(favoriteListFavorite);
                if (oldProductidOfFavoriteListFavorite != null) {
                    oldProductidOfFavoriteListFavorite.getFavoriteList().remove(favoriteListFavorite);
                    oldProductidOfFavoriteListFavorite = em.merge(oldProductidOfFavoriteListFavorite);
                }
            }
            for (Orderdetail orderdetailListOrderdetail : product.getOrderdetailList()) {
                Product oldProductidOfOrderdetailListOrderdetail = orderdetailListOrderdetail.getProductid();
                orderdetailListOrderdetail.setProductid(product);
                orderdetailListOrderdetail = em.merge(orderdetailListOrderdetail);
                if (oldProductidOfOrderdetailListOrderdetail != null) {
                    oldProductidOfOrderdetailListOrderdetail.getOrderdetailList().remove(orderdetailListOrderdetail);
                    oldProductidOfOrderdetailListOrderdetail = em.merge(oldProductidOfOrderdetailListOrderdetail);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Product product) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Product persistentProduct = em.find(Product.class, product.getProductid());
            List<Favorite> favoriteListOld = persistentProduct.getFavoriteList();
            List<Favorite> favoriteListNew = product.getFavoriteList();
            List<Orderdetail> orderdetailListOld = persistentProduct.getOrderdetailList();
            List<Orderdetail> orderdetailListNew = product.getOrderdetailList();
            List<Favorite> attachedFavoriteListNew = new ArrayList<Favorite>();
            for (Favorite favoriteListNewFavoriteToAttach : favoriteListNew) {
                favoriteListNewFavoriteToAttach = em.getReference(favoriteListNewFavoriteToAttach.getClass(), favoriteListNewFavoriteToAttach.getFavid());
                attachedFavoriteListNew.add(favoriteListNewFavoriteToAttach);
            }
            favoriteListNew = attachedFavoriteListNew;
            product.setFavoriteList(favoriteListNew);
            List<Orderdetail> attachedOrderdetailListNew = new ArrayList<Orderdetail>();
            for (Orderdetail orderdetailListNewOrderdetailToAttach : orderdetailListNew) {
                orderdetailListNewOrderdetailToAttach = em.getReference(orderdetailListNewOrderdetailToAttach.getClass(), orderdetailListNewOrderdetailToAttach.getOrderdetailid());
                attachedOrderdetailListNew.add(orderdetailListNewOrderdetailToAttach);
            }
            orderdetailListNew = attachedOrderdetailListNew;
            product.setOrderdetailList(orderdetailListNew);
            product = em.merge(product);
            for (Favorite favoriteListOldFavorite : favoriteListOld) {
                if (!favoriteListNew.contains(favoriteListOldFavorite)) {
                    favoriteListOldFavorite.setProductid(null);
                    favoriteListOldFavorite = em.merge(favoriteListOldFavorite);
                }
            }
            for (Favorite favoriteListNewFavorite : favoriteListNew) {
                if (!favoriteListOld.contains(favoriteListNewFavorite)) {
                    Product oldProductidOfFavoriteListNewFavorite = favoriteListNewFavorite.getProductid();
                    favoriteListNewFavorite.setProductid(product);
                    favoriteListNewFavorite = em.merge(favoriteListNewFavorite);
                    if (oldProductidOfFavoriteListNewFavorite != null && !oldProductidOfFavoriteListNewFavorite.equals(product)) {
                        oldProductidOfFavoriteListNewFavorite.getFavoriteList().remove(favoriteListNewFavorite);
                        oldProductidOfFavoriteListNewFavorite = em.merge(oldProductidOfFavoriteListNewFavorite);
                    }
                }
            }
            for (Orderdetail orderdetailListOldOrderdetail : orderdetailListOld) {
                if (!orderdetailListNew.contains(orderdetailListOldOrderdetail)) {
                    orderdetailListOldOrderdetail.setProductid(null);
                    orderdetailListOldOrderdetail = em.merge(orderdetailListOldOrderdetail);
                }
            }
            for (Orderdetail orderdetailListNewOrderdetail : orderdetailListNew) {
                if (!orderdetailListOld.contains(orderdetailListNewOrderdetail)) {
                    Product oldProductidOfOrderdetailListNewOrderdetail = orderdetailListNewOrderdetail.getProductid();
                    orderdetailListNewOrderdetail.setProductid(product);
                    orderdetailListNewOrderdetail = em.merge(orderdetailListNewOrderdetail);
                    if (oldProductidOfOrderdetailListNewOrderdetail != null && !oldProductidOfOrderdetailListNewOrderdetail.equals(product)) {
                        oldProductidOfOrderdetailListNewOrderdetail.getOrderdetailList().remove(orderdetailListNewOrderdetail);
                        oldProductidOfOrderdetailListNewOrderdetail = em.merge(oldProductidOfOrderdetailListNewOrderdetail);
                    }
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = product.getProductid();
                if (findProduct(id) == null) {
                    throw new NonexistentEntityException("The product with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Product product;
            try {
                product = em.getReference(Product.class, id);
                product.getProductid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The product with id " + id + " no longer exists.", enfe);
            }
            List<Favorite> favoriteList = product.getFavoriteList();
            for (Favorite favoriteListFavorite : favoriteList) {
                favoriteListFavorite.setProductid(null);
                favoriteListFavorite = em.merge(favoriteListFavorite);
            }
            List<Orderdetail> orderdetailList = product.getOrderdetailList();
            for (Orderdetail orderdetailListOrderdetail : orderdetailList) {
                orderdetailListOrderdetail.setProductid(null);
                orderdetailListOrderdetail = em.merge(orderdetailListOrderdetail);
            }
            em.remove(product);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Product> findProductEntities() {
        return findProductEntities(true, -1, -1);
    }

    public List<Product> findProductEntities(int maxResults, int firstResult) {
        return findProductEntities(false, maxResults, firstResult);
    }

    private List<Product> findProductEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Product.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Product findProduct(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Product.class, id);
        } finally {
            em.close();
        }
    }
    public List<Product> findProductname(String name) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("Product.findByProductname");
            q.setParameter("productname", "%"+name+"%");
            return (List<Product>) q.getResultList();
        } finally {
            em.close();
        }
    }
    public List<Product> findProducttype(String type) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("Product.findByProducttype");
            q.setParameter("producttype", type);
            return (List<Product>) q.getResultList();
        } finally {
            em.close();
        }
    }
    public List<Product> findByProductnametype(String name, String type) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("Product.findByProductnametype");
            q.setParameter("productname", "%"+name+"%");
            q.setParameter("producttype", type);
            return (List<Product>) q.getResultList();
        } finally {
            em.close();
        }
    }

    public int getProductCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Product> rt = cq.from(Product.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
