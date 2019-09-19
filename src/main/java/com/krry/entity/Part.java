package com.krry.entity;

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
@Document(collection = "part")
public class Part {

    //主键
    @Id
    private String id;
    //用户名
    @Field("partName")
    private String partName;

    private String part_x;

    private String part_y;

    private String part_z;


    public Part(String partName,String part_x,String part_y,String part_z) {
        this.partName = partName;
        this.part_x = part_x;
        this.part_y = part_y;
        this.part_z = part_z;
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

    public void setPartName(String partname) {
        this.partName = partname;
    }

    public String getPart_x() {
        return part_x;
    }

    public void setPart_x(String part_x) {
        this.part_x = part_x;
    }

    public String getPart_y() {
        return part_y;
    }

    public void setPart_y(String part_y) {
        this.part_y = part_y;
    }

    public String getPart_z() {
        return part_z;
    }

    public void setPart_z(String part_z) {
        this.part_z = part_z;
    }

    @Override
    public String toString() {
        return "Part{" +
                "id='" + id + '\'' +
                ", partName='" + partName + '\'' +
                ", part_x='" + part_x + '\'' +
                ", part_y='" + part_y + '\'' +
                ", part_z='" + part_z + '\'' +
                '}';
    }
}