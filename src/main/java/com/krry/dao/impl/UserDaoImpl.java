package com.krry.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.krry.dao.IUserDao;
import com.krry.entity.Part;

import java.util.List;

/**
 * @author
 */
@Repository
public class UserDaoImpl implements IUserDao {

    @Autowired
    private MongoTemplate mongoTemplate;

    public void addUser(Part Part) {
        //1.如果没有指定集合，则默认添加到和对象名称相同的集合中，没有则创建一个
        //2.也可以指定集合 mongoTemplate.save(User, "User_db");
        mongoTemplate.save(Part);
    }

    public void removeUser(String id) {

        Part Part = findById(id);
        mongoTemplate.remove(Part);
    }

    public void saveOrUpdateUser(Part Part) {
    	
        mongoTemplate.save(Part);
    }

    public Part findById(String id) {
    	
        return mongoTemplate.findById(id, Part.class);
    }

    public List<Part> findAll() {
    	
        return mongoTemplate.findAll(Part.class);
    }

	public Part findByUsername(String username) {
		//根据username查询
		Query sql = new Query(Criteria.where("username").is(username));
		
		return mongoTemplate.findOne(sql,Part.class);
	}
}




