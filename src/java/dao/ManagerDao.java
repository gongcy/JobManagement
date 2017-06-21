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
import pojo.Manager;

/**
 *
 * @author Administrator
 */
public class ManagerDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public void insert(Manager manager) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(manager);
        tx.commit();
        session.disconnect();
//        session.close();
    }
    
    public Manager getStudent(String magno) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        Manager m = (Manager)session.get(Manager.class, magno);
        tx.commit();
        session.disconnect();
        return m;
    }
}
