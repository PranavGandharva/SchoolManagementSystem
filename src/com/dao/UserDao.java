package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import com.vo.Student;
import com.vo.Teacher;
import com.vo.User;

public class UserDao {

	public void insert(User user,Object detail){
	
		
		Session session= GetSession.getSession();
        Transaction tx= session.beginTransaction();
       
       
        
        if(user.getUsertype()==Constant.USER_TYPE_STUDENT){
        	user.setStudent((Student) detail);
        } else if(user.getUsertype()==Constant.USER_TYPE_TEACHER){
        	user.setTeacher((Teacher) detail);
        }
        
        session.save(user);
        tx.commit();
        session.close();
 	 }
	
	public User getByUser(String username) {
		
	Session session= GetSession.getSession();
    Criteria cr = session.createCriteria(User.class);
    List ret = (List) cr.add(Restrictions.eq("username", username)).list();
    
    if(ret.size() > 0) {
    	return (User) ret.get(0);
    } else return null;
	    
	}	
	
	
	public static void main(String[] args) {
        new Configuration().configure().buildSessionFactory();
        new UserDao().getByUser("pranav");   
      
		   	}
}
