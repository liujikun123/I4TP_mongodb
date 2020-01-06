package com.i4tp.dao;

import java.util.List;

import com.i4tp.entity.*;

/**
 * @author
 */
public interface IUserDao {

    /**
     * 添加
     *
     * @param Part
     */
    public void addUser(Part Part);


    /**
     * 删除
     *
     * @param id
     */
    public void removeUser(String id);


    /**
     * 保存或修改
     *
     * @param Part
     */
    public void saveOrUpdateUser(Part Part);

    public void saveOrUpdateUser(process process);
    public void saveOrUpdateUser(File file);


    /**
     * 根据id查询单个
     *
     * @param id
     * @return
     */
    public Part findById(String id);

    public List<process> findByName(String name);

    /**
     * 根据用户名查询
     *
     * @param id
     * @return
     */
    public Part findByUsername(String partName);

    public List<process_type> findAllProcessType();

    public List<product_feature_type> findAllFeatureType();


    /**
     * 查询所有
     *
     * @return
     */
    public List<Part> findAll();

    public List<material_type> get_material_type();

    public List<Part> get_allParts();

    public List<manufacturing_cell> get_alleManufacturingCell();

    public List<control_cell> get_control_cell();

    public List<process_type> get_allProcess_type();


}

