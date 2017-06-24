/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.job.pojo.Manager;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public class ManagerDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void insert(Manager manager) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.save(manager);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    public void delete(String magno) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            Manager m = (Manager) session.load(Manager.class, magno);
            session.delete(m);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    public void update(String magno) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            Manager m = (Manager) session.get(Manager.class, magno);
            session.update(m);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    public Manager getManager(String magno) {
        Session session = null;
        Manager m = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            m = (Manager) session.get(Manager.class, magno);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
            return m;
        }
    }

}
