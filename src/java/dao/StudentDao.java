/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import pojo.Student;

/**
 *
 * @author Administrator
 */
public class StudentDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void insert(Student student) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(student);
        tx.commit();
        session.disconnect();
//        session.close();
    }
    
    public Student getStudent(String stuno) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        Student s = (Student)session.get(Student.class, stuno);
        tx.commit();
        session.disconnect();
        return s;
    }
    
}
