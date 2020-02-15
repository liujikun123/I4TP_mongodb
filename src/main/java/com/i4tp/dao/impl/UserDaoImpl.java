package com.i4tp.dao.impl;

import com.i4tp.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * @author
 * @author
 */
/**
 * @author
 */

/**
 * @author
 */
@Repository
public class UserDaoImpl {

    @Autowired
    private MongoTemplate mongoTemplate;

    public void addUser(Part Part) {
        //1.如果没有指定集合，则默认添加到和对象名称相同的集合中，没有则创建一个
        //2.也可以指定集合 mongoTemplate.save(User, "User_db");
        mongoTemplate.save(Part, "products");
    }

    public void removeUser(String id) {

        Part Part = findById(id);
        mongoTemplate.remove(Part);
    }

    public void saveOrUpdateUser(Part Part) {

//        System.out.println(Part.toString());
        mongoTemplate.save(Part, "products");
    }

    public void saveOrUpdateUser(process process) {

        mongoTemplate.save(process, "process");
    }
    public void saveOrUpdateUser(imgFile file) {

        mongoTemplate.save(file, "img");
    }

    public void saveManufacturingCell(manufacturing_cell mc) {

        mongoTemplate.save(mc, "manufacturing_cell");
        System.out.println("执行了。。。");

    }

    public Part findById(String id) {

        return mongoTemplate.findById(id, Part.class);
    }


    public List<process> findByName(String name) {
        //根据username查询
        Query sql = new Query(Criteria.where("name").is(name));
        return mongoTemplate.find(sql, process.class);
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
        return mongoTemplate.findOne(sql, Part.class);
    }

    //查找所有材料种类
    public List<material_type> get_material_type() {
        return mongoTemplate.findAll(material_type.class);
    }

    public List<Part> get_allParts() {
        return mongoTemplate.findAll(Part.class);
    }

    public List<process_type> get_allProcess_type() {
        return mongoTemplate.findAll(process_type.class);
    }

    public List<manufacturing_cell> get_alleManufacturingCell() {
        return mongoTemplate.findAll(manufacturing_cell.class);
    }

    public List<control_cell> get_control_cell() {
        return mongoTemplate.findAll(control_cell.class);
    }

    /**
     * @Title: byteToFile
     * @Description: 把二进制数据转成指定后缀名的文件，例如PDF，PNG等
     * @param contents 二进制数据
     * @param filePath 文件存放目录，包括文件名及其后缀，如D:\file\bike.jpg
     * @Author: Wiener
     * @Time: 2018-08-26 08:43:36
     */
    public void byteToFile(byte[] contents, String filePath) {
        BufferedInputStream bis = null;
        FileOutputStream fos = null;
        BufferedOutputStream output = null;
        try {
            ByteArrayInputStream byteInputStream = new ByteArrayInputStream(contents);
            bis = new BufferedInputStream(byteInputStream);
            File file = new File(filePath);
            // 获取文件的父路径字符串
            File path = file.getParentFile();
            if (!path.exists()) {
                boolean isCreated = path.mkdirs();
                if (!isCreated) {
                }
            }
            fos = new FileOutputStream(file);
            // 实例化OutputString 对象
            output = new BufferedOutputStream(fos);
            byte[] buffer = new byte[1024];
            int length = bis.read(buffer);
            while (length != -1) {
                output.write(buffer, 0, length);
                length = bis.read(buffer);
            }
            output.flush();
        } catch (Exception ignored) {
        } finally {
            try {
                bis.close();
                fos.close();
                output.close();
            } catch (IOException ignored) {
            }
        }
    }
}




