/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import pojo.Company;

/**
 *
 * @author Administrator
 */
public class CompanyDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public void insert(Company manager) {
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
            Company m = (Company) session.load(Company.class, magno);
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
            Company m = (Company) session.get(Company.class, magno);
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

    public Company getManager(String magno) {
        Session session = null;
        Company m = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            m = (Company) session.get(Company.class, magno);
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
