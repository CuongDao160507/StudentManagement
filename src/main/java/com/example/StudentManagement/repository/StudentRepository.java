package com.example.StudentManagement.repository;

import com.example.StudentManagement.model.Student;
import com.example.StudentManagement.util.HibernateConfig;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class StudentRepository {
    private Session session = null;

    public StudentRepository() {
        session = HibernateConfig.getFACTORY().openSession();
    }

    public List<Student> getAll() {
        Query query = session.createQuery("from Student ");
        return query.list();
    }

    public Student detailStudent (Integer id) {
        return session.find(Student.class, id);
    }

    public void addStudent (Student student) {
        try {
            session.getTransaction().begin();
            session.save(student);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void updateStudent (Student student) {
        try {
            session.getTransaction().begin();
            session.merge(student);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void deleteStudent (Integer id) {
        try {
            session.getTransaction().begin();
            session.delete(this.detailStudent(id));
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public List<Student> sortByGPA() {
        Query query = session.createQuery("from Student stu order by stu.gpa DESC");
        return query.list();
    }

    public List<Student> searchByFullName(String fullName) {
        Query query = session.createQuery("from Student stu WHERE stu.fullName like :fullName");
        query.setParameter("fullName", "%" + fullName + "%");
        return query.list();
    }

    public List<Student> pagination (Integer page, Integer pageSize) {
        Query query = session.createQuery("from Student");
        query.setFirstResult(page * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }
}
