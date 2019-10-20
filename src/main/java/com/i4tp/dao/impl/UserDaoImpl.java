package com.i4tp.dao.impl;

import com.i4tp.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.i4tp.dao.IUserDao;

import java.util.List;

/**
 * @author
 */
/**
 * @author
 */
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
        mongoTemplate.save(Part,"products");
    }

    public void removeUser(String id) {

        Part Part = findById(id);
        mongoTemplate.remove(Part);
    }

    public void saveOrUpdateUser(Part Part) {

        mongoTemplate.save(Part,"products");
    }
    public void saveOrUpdateUser(process process) {

        mongoTemplate.save(process,"process");
    }

    public void saveManufacturingCell(manufacturing_cell mc){

        mongoTemplate.save(mc,"manufacturing_cell");
        System.out.println("执行了。。。");

    }

    public Part findById(String id) {
    	
        return mongoTemplate.findById(id, Part.class);
    }


    public List<process> findByName(String name) {
        //根据username查询
        Query sql = new Query(Criteria.where("name").is(name));
        return mongoTemplate.find(sql,process.class);
    }
    public List<Part> findAll() {
    	
        return mongoTemplate.findAll(Part.class);
    }

    public List<process_type> findAllProcessType() {

        return mongoTemplate.findAll(process_type.class);
    }

    public List<product_feature_type> findAllFeatureType() {

        return mongoTemplate.findAll(product_feature_type.class);
    }

	public Part findByUsername(String username) {
		//根据username查询
		Query sql = new Query(Criteria.where("partName").is(username));
		return mongoTemplate.findOne(sql,Part.class);
	}
//查找所有材料种类
    public List<material_type> get_material_type() {
        return mongoTemplate.findAll(material_type.class);
    }

    public List<Part> get_allParts() {
        return mongoTemplate.findAll(Part.class);
    }

    public List<manufacturing_cell> get_alleManufacturingCell(){return mongoTemplate.findAll(manufacturing_cell.class);}

    public List<control_cell> get_control_cell(){return mongoTemplate.findAll(control_cell.class);}

}




