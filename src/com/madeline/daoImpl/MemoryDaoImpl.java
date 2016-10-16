package com.madeline.daoImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.madeline.dao.MemoryDao;
import com.madeline.entity.Artefact;
import com.madeline.entity.Floor;
import com.madeline.entity.Memory;
import com.madeline.entity.RelationRoomMemory;
import com.madeline.entity.RelationUserMemory;


@Repository @Transactional
public class MemoryDaoImpl implements MemoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public boolean addMemory(Memory memory) {
		Session session = sessionFactory.openSession();
		try{
			session.save(memory);
			Query<?> query = session.createQuery("select max(m.id) from Memory m");
			int result = (int)query.getSingleResult();
			RelationRoomMemory rm = new RelationRoomMemory(result, memory.getRoomid());
			session.save(rm);
			RelationUserMemory um = new RelationUserMemory(result, memory.getUserid());
			session.save(um);
		}catch(ConstraintViolationException cve){
			return false;
		}catch(NoResultException ne){
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteMemory(Memory memory) {
		Session session = sessionFactory.openSession();
		Query<?> query = session.createQuery("from Memory where memoryid='" + memory.getMemoryid() + "'");
		try{
			memory = (Memory) query.getSingleResult();
		}catch(NoResultException ne){
			return false;
		}
		memory.setIsdeleted(true);
		try{
			session.update(memory);
		// TODO
		}catch(Exception e){
			return false;
		}
		query = session.createQuery("from RelationRoomMemory where memoryid='" + memory.getMemoryid() + "'");
		RelationRoomMemory rm;
		try{
			rm = (RelationRoomMemory) query.getSingleResult();
			session.delete(rm);
		}catch(NoResultException ne){
			return false;
		// TODO
		}catch(Exception e){
			return false;
		}
		
		query = session.createQuery("from RelationUserMemory where memoryid='" + memory.getMemoryid() + "'");
		RelationUserMemory um;
		try{
			um = (RelationUserMemory) query.getSingleResult();
			session.delete(um);
		}catch(NoResultException ne){
			return false;
		// TODO
		}catch(Exception e){
			return false;
		}
		return true;
	}
	

	@Override
	public boolean modifyMemory(Memory memory) {
		Session session = sessionFactory.openSession();
		Query<?> query = session.createQuery("from Memory where memoryid='" + memory.getMemoryid() + "'");
		try{
			query.getSingleResult();
		}catch(NoResultException ne){
			return false;
		}
		try{
			session.update(memory);
		// TODO
		}catch(Exception e){
			return false;
		}
		
		query = session.createQuery("from RelationRoomMemory where memoryid='" + memory.getMemoryid() + "'");
		RelationRoomMemory rm;
		try{
			rm = (RelationRoomMemory) query.getSingleResult();
			rm.setRoomid(memory.getRoomid());
			session.update(rm);
		}catch(NoResultException ne){
			return false;
		// TODO
		}catch(Exception e){
			return false;
		}
		
		query = session.createQuery("from RelationUserMemory where memoryid='" + memory.getMemoryid() + "'");
		RelationUserMemory um;
		try{
			um = (RelationUserMemory) query.getSingleResult();
			um.setUserid(memory.getUserid());
			session.update(um);
		}catch(NoResultException ne){
			return false;
		// TODO
		}catch(Exception e){
			return false;
		}
		
		
		return true;
	}

	@Override
	public String memoryShow(String date, int status, int page, int size) {
		Session session = sessionFactory.getCurrentSession();
		String HQL = "from Memory where 1=1";
			
		if(status==1)
			HQL += " and isapproved=1 ";
		else if(status==2)
			HQL += " and isapproved=0 ";
		else if(status==3)
			HQL += " and isapproved=null ";
		else if(status==-1)
			return "wrong status";
		HQL += " and isdeleted=0";
		
		System.out.println(HQL);
		Query<?> query = session.createQuery(HQL).setFirstResult((page-1)*size).setMaxResults(size);
		List<Floor> result = new ArrayList<Floor>();
		try{
			result = (List<Floor>) query.getResultList();
		}catch(Exception e){
			return null;
		}
		Gson gson = new Gson();
		HQL = "select count(*)" + HQL;
		query = session.createQuery(HQL);
		Date d = new Date();
		
		if(!date.isEmpty())
		{
			String[] s = date.split("/");
			String fDate = s[2]+"-"+s[0]+"-"+s[1]+" ";
			System.out.println("Show"+fDate);
			
			HQL += " and publishdate=?";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd "); 
			try {
				d = sdf.parse(fDate);
				System.out.println("aaaa"+d.getTime());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			query.setDate(0, d);
		}
		
		
		System.out.println(HQL);
		
		long pages = (long)query.getSingleResult()/size + ((long)query.getSingleResult()%size==0?0:1);
		return pages + "||" + gson.toJson(result);
	}
		

	@Override
	public String memoryShow(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from Memory where userid='" + id + "'");
		Memory memory = null;
		try{
			memory = (Memory)query.getSingleResult();
		}catch(NoResultException ne){
			return null;
		}
		Gson gson = new Gson();
		return gson.toJson(memory);
	}


}
