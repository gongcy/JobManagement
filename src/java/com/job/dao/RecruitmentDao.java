/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.job.pojo.Recruitment;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public class RecruitmentDao {
    
    @Autowired
    private SessionFactory sessionFactory;

    public void insert(Recruitment manager) {
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
            Recruitment m = (Recruitment) session.load(Recruitment.class, magno);
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
            Recruitment m = (Recruitment) session.get(Recruitment.class, magno);
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

    public Recruitment getManager(String magno) {
        Session session = null;
        Recruitment m = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            m = (Recruitment) session.get(Recruitment.class, magno);
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
