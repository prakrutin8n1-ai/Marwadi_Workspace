package com.bo;

import java.util.List;

import com.dao.DAO;
import com.model.Person;

public class BO {

    private DAO dao;

    public DAO getDao() {
        return dao;
    }

    public void setDao(DAO dao) {
        this.dao = dao;
    }

    public void insert(Person p) {
        dao.insert(p);
    }

    public void update(Person p) {
        dao.update(p);
    }

    public void delete(Person p) {
        dao.delete(p);
    }

    public List<Person> getall() {
        return dao.getall();
    }

    public Person getSingle(Person p) {
        return dao.getSingle(p);
    }
}