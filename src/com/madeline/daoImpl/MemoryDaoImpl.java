package com.madeline.daoImpl;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.madeline.dao.MemoryDao;
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
			Query<?> query = session.createQuery("select max(m.id) from Memory");
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
	public boolean searchMemory(Memory memory) {
		// TODO Auto-generated method stub
		return false;
	}

}
