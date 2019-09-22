package com.krry.dao;

import java.util.List;

import com.krry.entity.Part;
import com.krry.entity.User;
import com.krry.entity.material_type;

/**
 * 
 * @author
 */
public interface IUserDao {
	
    /**
     * 添加
     * @param Part
     */
    public void addUser(Part Part);


    /**
     * 删除
     * @param id
     */
    public void removeUser(String id);


    /**
     * 保存或修改
     * @param Part
     */
    public void saveOrUpdateUser(Part Part);


    /**
     * 根据id查询单个
     * @param id
     * @return
     */
    public Part findById(String id);
    
    /**
     * 根据用户名查询
     * @param id
     * @return
     */
    public Part findByUsername(String partName);


    /**
     * 查询所有
     * @return
     */
    public List<Part> findAll();

    public List<material_type> get_material_type();

    public List<Part> get_allParts();

}

