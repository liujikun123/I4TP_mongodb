package com.i4tp.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.List;


/**
 * @author krry
 * @version 1.0.0
 * @Document(collection = "user")这个注解和Hibernate的注解Entiry非常相似，
 * 就是定义一个文档，对象MongoDB存储的Collection（表）的名称是user
 * @Id指该字段是主键，不能缺少
 * @Field("username")指该字段映射MongoDB的实际字段，如果一致可以省略、 User
 */
@Document(collection = "control_cell")
public class control_cell {
    @Id
    private String id;
    private String name;
    private String device_model;
    private String operating_system;
    private String manufacturer;
    private List<String> function_parts;
    private List<String> bus_interface;
    private List<String> data_protocol;

    public control_cell() {

    }

    public control_cell(String name, String device_model, String operating_system, String manufacturer, List<String> function_parts, List<String> bus_interface, List<String> data_protocol) {
        this.name = name;
        this.device_model = device_model;
        this.operating_system = operating_system;
        this.manufacturer = manufacturer;
        this.function_parts = function_parts;
        this.bus_interface = bus_interface;
        this.data_protocol = data_protocol;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDevice_model() {
        return device_model;
    }

    public void setDevice_model(String device_model) {
        this.device_model = device_model;
    }

    public String getOperating_system() {
        return operating_system;
    }

    public void setOperating_system(String operating_system) {
        this.operating_system = operating_system;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public List<String> getFunction_parts() {
        return function_parts;
    }

    public void setFunction_parts(List<String> function_parts) {
        this.function_parts = function_parts;
    }

    public List<String> getBus_interface() {
        return bus_interface;
    }

    public void setBus_interface(List<String> bus_interface) {
        this.bus_interface = bus_interface;
    }

    public List<String> getData_protocol() {
        return data_protocol;
    }

    public void setData_protocol(List<String> data_protocol) {
        this.data_protocol = data_protocol;
    }

    @Override
    public String toString() {
        return "control_cell{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", device_model='" + device_model + '\'' +
                ", operating_system='" + operating_system + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", function_parts=" + function_parts +
                ", bus_interface=" + bus_interface +
                ", data_protocol=" + data_protocol +
                '}';
    }
}


