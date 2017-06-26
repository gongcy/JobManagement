/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.job.pojo.Resume;
import com.job.pojo.Student;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
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
    
    public List<Resume> getResumes(String stuno) {
        Session session = null;
        List<Resume> l = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            Query q = session.createQuery("from Resume where studentno='" + stuno + "'");
            l = (List<Resume>) q.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
            return l;
        }
    }
    
    public boolean changeProfile(String sid, Integer age, String edu, String email) {
        Session session = null;
        
        try {
            Resume s = getResumes(sid).get(0);
            session.beginTransaction();
            session = sessionFactory.openSession();
            session.beginTransaction();
            s.setAge(age);
            s.setEducation(edu);
            s.setEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
                return true;
            }
            return false;
        }
    }
    
    public boolean changeResume(String sid, String skills) {
        Session session = null;
        Resume s = getResumes(sid).get(0);
        try {
            session.beginTransaction();
            session = sessionFactory.openSession();
            session.beginTransaction();
            s.setSkills(skills);
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
                return true;
            }
            return false;
        }
    }
    
}
