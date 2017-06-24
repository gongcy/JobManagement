/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.job.pojo.Student;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public class StudentDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void insert(Student student) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            session.save(student);
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

    public void delete(String stuno) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            Student s = (Student) session.load(Student.class, stuno);
            session.delete(s);
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

    public void update(String stuno) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            Student s = (Student) session.load(Student.class, stuno);
            session.update(s);
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

    public Student getStudent(String stuno) {
        Session session = null;
        Student s = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            s = (Student) session.get(Student.class, stuno);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
            return s;
        }
    }

    public boolean changePassword(String sid, String newpwd) {
        Session session = null;
        Student s = getStudent(sid);
        try {
            session.beginTransaction();
            session = sessionFactory.openSession();
            session.beginTransaction();
            s.setPassword(newpwd);
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

    public List<Student> getAllStudents() {
        Session session = null;
        List<Student> s = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            Query q = session.createQuery("from Student");
            s = (List<Student>) q.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
            return s;
        }
    }

}
