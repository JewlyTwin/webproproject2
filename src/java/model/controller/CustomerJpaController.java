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
import model.Payment;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import model.Customer;
import model.Orders;
import model.Favorite;
import model.controller.exceptions.NonexistentEntityException;
import model.controller.exceptions.PreexistingEntityException;
import model.controller.exceptions.RollbackFailureException;

/**
 *
 * @author earnnchp
 */
public class CustomerJpaController implements Serializable {

    public CustomerJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Customer customer) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (customer.getPaymentList() == null) {
            customer.setPaymentList(new ArrayList<Payment>());
        }
        if (customer.getOrdersList() == null) {
            customer.setOrdersList(new ArrayList<Orders>());
        }
        if (customer.getFavoriteList() == null) {
            customer.setFavoriteList(new ArrayList<Favorite>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Payment> attachedPaymentList = new ArrayList<Payment>();
            for (Payment paymentListPaymentToAttach : customer.getPaymentList()) {
                paymentListPaymentToAttach = em.getReference(paymentListPaymentToAttach.getClass(), paymentListPaymentToAttach.getPaymentid());
                attachedPaymentList.add(paymentListPaymentToAttach);
            }
            customer.setPaymentList(attachedPaymentList);
            List<Orders> attachedOrdersList = new ArrayList<Orders>();
            for (Orders ordersListOrdersToAttach : customer.getOrdersList()) {
                ordersListOrdersToAttach = em.getReference(ordersListOrdersToAttach.getClass(), ordersListOrdersToAttach.getOrderid());
                attachedOrdersList.add(ordersListOrdersToAttach);
            }
            customer.setOrdersList(attachedOrdersList);
            List<Favorite> attachedFavoriteList = new ArrayList<Favorite>();
            for (Favorite favoriteListFavoriteToAttach : customer.getFavoriteList()) {
                favoriteListFavoriteToAttach = em.getReference(favoriteListFavoriteToAttach.getClass(), favoriteListFavoriteToAttach.getFavid());
                attachedFavoriteList.add(favoriteListFavoriteToAttach);
            }
            customer.setFavoriteList(attachedFavoriteList);
            em.persist(customer);
            for (Payment paymentListPayment : customer.getPaymentList()) {
                Customer oldUsernameOfPaymentListPayment = paymentListPayment.getUsername();
                paymentListPayment.setUsername(customer);
                paymentListPayment = em.merge(paymentListPayment);
                if (oldUsernameOfPaymentListPayment != null) {
                    oldUsernameOfPaymentListPayment.getPaymentList().remove(paymentListPayment);
                    oldUsernameOfPaymentListPayment = em.merge(oldUsernameOfPaymentListPayment);
                }
            }
            for (Orders ordersListOrders : customer.getOrdersList()) {
                Customer oldUsernameOfOrdersListOrders = ordersListOrders.getUsername();
                ordersListOrders.setUsername(customer);
                ordersListOrders = em.merge(ordersListOrders);
                if (oldUsernameOfOrdersListOrders != null) {
                    oldUsernameOfOrdersListOrders.getOrdersList().remove(ordersListOrders);
                    oldUsernameOfOrdersListOrders = em.merge(oldUsernameOfOrdersListOrders);
                }
            }
            for (Favorite favoriteListFavorite : customer.getFavoriteList()) {
                Customer oldUsernameOfFavoriteListFavorite = favoriteListFavorite.getUsername();
                favoriteListFavorite.setUsername(customer);
                favoriteListFavorite = em.merge(favoriteListFavorite);
                if (oldUsernameOfFavoriteListFavorite != null) {
                    oldUsernameOfFavoriteListFavorite.getFavoriteList().remove(favoriteListFavorite);
                    oldUsernameOfFavoriteListFavorite = em.merge(oldUsernameOfFavoriteListFavorite);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findCustomer(customer.getUsername()) != null) {
                throw new PreexistingEntityException("Customer " + customer + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Customer customer) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Customer persistentCustomer = em.find(Customer.class, customer.getUsername());
            List<Payment> paymentListOld = persistentCustomer.getPaymentList();
            List<Payment> paymentListNew = customer.getPaymentList();
            List<Orders> ordersListOld = persistentCustomer.getOrdersList();
            List<Orders> ordersListNew = customer.getOrdersList();
            List<Favorite> favoriteListOld = persistentCustomer.getFavoriteList();
            List<Favorite> favoriteListNew = customer.getFavoriteList();
            List<Payment> attachedPaymentListNew = new ArrayList<Payment>();
            for (Payment paymentListNewPaymentToAttach : paymentListNew) {
                paymentListNewPaymentToAttach = em.getReference(paymentListNewPaymentToAttach.getClass(), paymentListNewPaymentToAttach.getPaymentid());
                attachedPaymentListNew.add(paymentListNewPaymentToAttach);
            }
            paymentListNew = attachedPaymentListNew;
            customer.setPaymentList(paymentListNew);
            List<Orders> attachedOrdersListNew = new ArrayList<Orders>();
            for (Orders ordersListNewOrdersToAttach : ordersListNew) {
                ordersListNewOrdersToAttach = em.getReference(ordersListNewOrdersToAttach.getClass(), ordersListNewOrdersToAttach.getOrderid());
                attachedOrdersListNew.add(ordersListNewOrdersToAttach);
            }
            ordersListNew = attachedOrdersListNew;
            customer.setOrdersList(ordersListNew);
            List<Favorite> attachedFavoriteListNew = new ArrayList<Favorite>();
            for (Favorite favoriteListNewFavoriteToAttach : favoriteListNew) {
                favoriteListNewFavoriteToAttach = em.getReference(favoriteListNewFavoriteToAttach.getClass(), favoriteListNewFavoriteToAttach.getFavid());
                attachedFavoriteListNew.add(favoriteListNewFavoriteToAttach);
            }
            favoriteListNew = attachedFavoriteListNew;
            customer.setFavoriteList(favoriteListNew);
            customer = em.merge(customer);
            for (Payment paymentListOldPayment : paymentListOld) {
                if (!paymentListNew.contains(paymentListOldPayment)) {
                    paymentListOldPayment.setUsername(null);
                    paymentListOldPayment = em.merge(paymentListOldPayment);
                }
            }
            for (Payment paymentListNewPayment : paymentListNew) {
                if (!paymentListOld.contains(paymentListNewPayment)) {
                    Customer oldUsernameOfPaymentListNewPayment = paymentListNewPayment.getUsername();
                    paymentListNewPayment.setUsername(customer);
                    paymentListNewPayment = em.merge(paymentListNewPayment);
                    if (oldUsernameOfPaymentListNewPayment != null && !oldUsernameOfPaymentListNewPayment.equals(customer)) {
                        oldUsernameOfPaymentListNewPayment.getPaymentList().remove(paymentListNewPayment);
                        oldUsernameOfPaymentListNewPayment = em.merge(oldUsernameOfPaymentListNewPayment);
                    }
                }
            }
            for (Orders ordersListOldOrders : ordersListOld) {
                if (!ordersListNew.contains(ordersListOldOrders)) {
                    ordersListOldOrders.setUsername(null);
                    ordersListOldOrders = em.merge(ordersListOldOrders);
                }
            }
            for (Orders ordersListNewOrders : ordersListNew) {
                if (!ordersListOld.contains(ordersListNewOrders)) {
                    Customer oldUsernameOfOrdersListNewOrders = ordersListNewOrders.getUsername();
                    ordersListNewOrders.setUsername(customer);
                    ordersListNewOrders = em.merge(ordersListNewOrders);
                    if (oldUsernameOfOrdersListNewOrders != null && !oldUsernameOfOrdersListNewOrders.equals(customer)) {
                        oldUsernameOfOrdersListNewOrders.getOrdersList().remove(ordersListNewOrders);
                        oldUsernameOfOrdersListNewOrders = em.merge(oldUsernameOfOrdersListNewOrders);
                    }
                }
            }
            for (Favorite favoriteListOldFavorite : favoriteListOld) {
                if (!favoriteListNew.contains(favoriteListOldFavorite)) {
                    favoriteListOldFavorite.setUsername(null);
                    favoriteListOldFavorite = em.merge(favoriteListOldFavorite);
                }
            }
            for (Favorite favoriteListNewFavorite : favoriteListNew) {
                if (!favoriteListOld.contains(favoriteListNewFavorite)) {
                    Customer oldUsernameOfFavoriteListNewFavorite = favoriteListNewFavorite.getUsername();
                    favoriteListNewFavorite.setUsername(customer);
                    favoriteListNewFavorite = em.merge(favoriteListNewFavorite);
                    if (oldUsernameOfFavoriteListNewFavorite != null && !oldUsernameOfFavoriteListNewFavorite.equals(customer)) {
                        oldUsernameOfFavoriteListNewFavorite.getFavoriteList().remove(favoriteListNewFavorite);
                        oldUsernameOfFavoriteListNewFavorite = em.merge(oldUsernameOfFavoriteListNewFavorite);
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
                String id = customer.getUsername();
                if (findCustomer(id) == null) {
                    throw new NonexistentEntityException("The customer with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Customer customer;
            try {
                customer = em.getReference(Customer.class, id);
                customer.getUsername();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The customer with id " + id + " no longer exists.", enfe);
            }
            List<Payment> paymentList = customer.getPaymentList();
            for (Payment paymentListPayment : paymentList) {
                paymentListPayment.setUsername(null);
                paymentListPayment = em.merge(paymentListPayment);
            }
            List<Orders> ordersList = customer.getOrdersList();
            for (Orders ordersListOrders : ordersList) {
                ordersListOrders.setUsername(null);
                ordersListOrders = em.merge(ordersListOrders);
            }
            List<Favorite> favoriteList = customer.getFavoriteList();
            for (Favorite favoriteListFavorite : favoriteList) {
                favoriteListFavorite.setUsername(null);
                favoriteListFavorite = em.merge(favoriteListFavorite);
            }
            em.remove(customer);
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

    public List<Customer> findCustomerEntities() {
        return findCustomerEntities(true, -1, -1);
    }

    public List<Customer> findCustomerEntities(int maxResults, int firstResult) {
        return findCustomerEntities(false, maxResults, firstResult);
    }

    private List<Customer> findCustomerEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Customer.class));
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

    public Customer findCustomer(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Customer.class, id);
        } finally {
            em.close();
        }
    }

    public int getCustomerCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Customer> rt = cq.from(Customer.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
