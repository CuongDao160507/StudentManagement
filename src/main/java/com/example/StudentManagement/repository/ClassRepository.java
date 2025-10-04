package com.example.StudentManagement.repository;

import com.example.StudentManagement.model.Class;
import com.example.StudentManagement.util.HibernateConfig;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class ClassRepository {
    private Session session = null;

    public ClassRepository() {
        session = HibernateConfig.getFACTORY().openSession();
    }

    public List<Class> getAll() {
        Query query = session.createQuery("from Class");
        return query.list();
    }

    public Class detailClass (Integer id) {
        return session.find(Class.class, id);
    }
}
