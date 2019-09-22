package com.i4tp.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;


/**
 * @Document(collection = "user")这个注解和Hibernate的注解Entiry非常相似，
 * 就是定义一个文档，对象MongoDB存储的Collection（表）的名称是user
 * @Id指该字段是主键，不能缺少
 * @Field("username")指该字段映射MongoDB的实际字段，如果一致可以省略、
 *
 * User
 * @author krry
 * @version 1.0.0
 *
 */
@Document(collection = "products")
public class Part {
    @Id
    private String id;

    @Field("product_name")
    private String partName;
        private  double workpiece_dimensions_x;
        private  double workpiece_dimensions_y;
        private  double workpiece_dimensions_z;
    private String material_type;
    private double workpiece_weight_kg;
    private Boolean multiaspect;
    private Boolean rotation;
    private String process;

    public Part(String partName,  double workpiece_dimensions_x, double workpiece_dimensions_y, double workpiece_dimensions_z,String material_type, double workpiece_weight_kg, Boolean multiaspect, Boolean rotation) {
        this.partName = partName;
        this.workpiece_dimensions_x = workpiece_dimensions_x;
        this.workpiece_dimensions_y = workpiece_dimensions_y;
        this.workpiece_dimensions_z = workpiece_dimensions_z;
        this.material_type = material_type;
        this.workpiece_weight_kg = workpiece_weight_kg;
        this.multiaspect = multiaspect;
        this.rotation = rotation;;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public String getMaterial() {
        return material_type;
    }

    public double getX() {
        return workpiece_dimensions_x;
    }

    public void setX(double x) {
        this.workpiece_dimensions_x = x;
    }

    public double getY() {
        return workpiece_dimensions_y;
    }

    public void setY(double y) {
        this.workpiece_dimensions_y = y;
    }

    public double getZ() {
        return workpiece_dimensions_z;
    }

    public void setZ(double z) {
        this.workpiece_dimensions_z = z;
    }

    public void setMaterial(String material) {
        this.material_type = material;
    }

    public double getWorkpiece_weight_kg() {
        return workpiece_weight_kg;
    }

    public void setWorkpiece_weight_kg(double workpiece_weight_kg) {
        this.workpiece_weight_kg = workpiece_weight_kg;
    }

    public Boolean getMultiaspect() {
        return multiaspect;
    }

    public void setMultiaspect(Boolean multiaspect) {
        this.multiaspect = multiaspect;
    }

    public Boolean getRotation() {
        return rotation;
    }

    public void setRotation(Boolean rotation) {
        this.rotation = rotation;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    @Override
    public String toString() {
        return
                "id=" + id + '\n' +
                "partName=" + partName + '\n' +
                "workpiece_dimensions_x=" + workpiece_dimensions_x + '\n'+
                "workpiece_dimensions_y=" + workpiece_dimensions_y + '\n'+
                "workpiece_dimensions_z=" + workpiece_dimensions_z +'\n'+
                "material=" + material_type + '\n' +
                "workpiece_weight_kg=" + workpiece_weight_kg +'\n'+
                "multiaspect=" + multiaspect +'\n'+
                "rotation=" + rotation +'\n'+
                "process=" + process + '\n'
                ;
    }
}