package com.dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;

import com.model.Person;
public class DAO {

    private EntityManagerFactory entityManagerFactory;

    public EntityManagerFactory getEntityManagerFactory() {
        return entityManagerFactory;
    }

    public void setEntityManagerFactory(
            EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
    }

    public void insert(Person p) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.persist(p);
            tx.commit();
            System.out.println("Person inserted successfully");
        } catch (RuntimeException e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public void update(Person p) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            Person existing = em.find(Person.class, p.getId());

            if (existing != null) {
                existing.setName(p.getName());
                tx.commit();
                System.out.println("Person updated successfully");
            } else {
                tx.rollback();
                System.out.println("Person not found");
            }
        } catch (RuntimeException e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public void delete(Person p) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            Person existing = em.find(Person.class, p.getId());

            if (existing != null) {
                em.remove(existing);
                tx.commit();
                System.out.println("Person deleted successfully");
            } else {
                tx.rollback();
                System.out.println("Person not found");
            }
        } catch (RuntimeException e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public List<Person> getall() {
        EntityManager em = entityManagerFactory.createEntityManager();

        try {
            return em.createQuery(
                    "SELECT p FROM Person p", Person.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public Person getSingle(Person p) {
        EntityManager em = entityManagerFactory.createEntityManager();

        try {
            return em.find(Person.class, p.getId());
        } finally {
            em.close();
        }
    }
}