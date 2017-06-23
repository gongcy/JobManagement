/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import pojo.Resume;

/**
 *
 * @author Administrator
 */
public class ResumeDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void insert(Resume manager) {
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
            Resume m = (Resume) session.load(Resume.class, magno);
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
            Resume m = (Resume) session.get(Resume.class, magno);
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

    public Resume getManager(String magno) {
        Session session = null;
        Resume m = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            m = (Resume) session.get(Resume.class, magno);
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
