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
@Document(collection = "manufacturing_cell")
public class manufacturing_cell {
    @Id
    private String id;
    private String name;
    private String device_model;
    private String operating_system;
    private String manufacturer;
    private List<String> process_type;
    private workspace_mm workspace_mm;
    private max_dimensions_of_workpiece_mm max_dimensions_of_workpiece_mm;
    private Boolean ability_of_multiaspect;
    private Boolean ability_of_processing_unrotated_part;
    private double durable_weight_kg;
    private double max_rotated_speed_rpm;
    private double max_feed_speed_mm_min;
    private double max_holding_torque_N_m;
    private double best_surface_roughness_um;
    private double best_surface_accuracy_mm;
    private double best_storage_capacity;
    private List<String> spindle_interface;
    private List<String> bus_interface;
    private List<String> data_protocol;
    private double mFactor = 1.0;
    private double tFactor = 1.0;
    private double max_power_kW = 40;

    public manufacturing_cell() {
    }

    public manufacturing_cell(String name, String device_model, String operating_system, String manufacturer, List<String> process_type, com.i4tp.entity.workspace_mm workspace_mm, com.i4tp.entity.max_dimensions_of_workpiece_mm max_dimensions_of_workpiece_mm, Boolean ability_of_multiaspect, Boolean ability_of_processing_unrotated_part, double durable_weight_kg, double max_rotated_speed_rpm, double max_feed_speed_mm_min, double max_holding_torque_N_m, double best_surface_roughness_um, double best_surface_accuracy_mm, double best_storage_capacity, List<String> spindle_interface, List<String> bus_interface, List<String> data_protocol, double mFactor, double tFactor, double max_power_kW) {
        this.name = name;
        this.device_model = device_model;
        this.operating_system = operating_system;
        this.manufacturer = manufacturer;
        this.process_type = process_type;
        this.workspace_mm = workspace_mm;
        this.max_dimensions_of_workpiece_mm = max_dimensions_of_workpiece_mm;
        this.ability_of_multiaspect = ability_of_multiaspect;
        this.ability_of_processing_unrotated_part = ability_of_processing_unrotated_part;
        this.durable_weight_kg = durable_weight_kg;
        this.max_rotated_speed_rpm = max_rotated_speed_rpm;
        this.max_feed_speed_mm_min = max_feed_speed_mm_min;
        this.max_holding_torque_N_m = max_holding_torque_N_m;
        this.best_surface_roughness_um = best_surface_roughness_um;
        this.best_surface_accuracy_mm = best_surface_accuracy_mm;
        this.best_storage_capacity = best_storage_capacity;
        this.spindle_interface = spindle_interface;
        this.bus_interface = bus_interface;
        this.data_protocol = data_protocol;
        this.mFactor = mFactor;
        this.tFactor = tFactor;
        this.max_power_kW = max_power_kW;
    }

    public com.i4tp.entity.workspace_mm getWorkspace_mm() {
        return workspace_mm;
    }

    public void setWorkspace_mm(com.i4tp.entity.workspace_mm workspace_mm) {
        this.workspace_mm = workspace_mm;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getMax_power_kW() {
        return max_power_kW;
    }

    public void setMax_power_kW(double max_power_kW) {
        this.max_power_kW = max_power_kW;
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

    public List<String> getProcess_type() {
        return process_type;
    }

    public void setProcess_type(List<String> process_type) {
        this.process_type = process_type;
    }

    public com.i4tp.entity.max_dimensions_of_workpiece_mm getMax_dimensions_of_workpiece_mm() {
        return max_dimensions_of_workpiece_mm;
    }

    public void setMax_dimensions_of_workpiece_mm(com.i4tp.entity.max_dimensions_of_workpiece_mm max_dimensions_of_workpiece_mm) {
        this.max_dimensions_of_workpiece_mm = max_dimensions_of_workpiece_mm;
    }

    public Boolean getAbility_of_multiaspect() {
        return ability_of_multiaspect;
    }

    public void setAbility_of_multiaspect(Boolean ability_of_multiaspect) {
        this.ability_of_multiaspect = ability_of_multiaspect;
    }

    public Boolean getAbility_of_processing_unrotated_part() {
        return ability_of_processing_unrotated_part;
    }

    public void setAbility_of_processing_unrotated_part(Boolean ability_of_processing_unrotated_part) {
        this.ability_of_processing_unrotated_part = ability_of_processing_unrotated_part;
    }

    public double getmFactor() {
        return mFactor;
    }

    public void setmFactor(double mFactor) {
        this.mFactor = mFactor;
    }

    public double gettFactor() {
        return tFactor;
    }

    public void settFactor(double tFactor) {
        this.tFactor = tFactor;
    }

    public double getDurable_weight_kg() {
        return durable_weight_kg;
    }

    public void setDurable_weight_kg(double durable_weight_kg) {
        this.durable_weight_kg = durable_weight_kg;
    }

    public double getMax_rotated_speed_rpm() {
        return max_rotated_speed_rpm;
    }

    public void setMax_rotated_speed_rpm(double max_rotated_speed_rpm) {
        this.max_rotated_speed_rpm = max_rotated_speed_rpm;
    }

    public double getMax_feed_speed_mm_min() {
        return max_feed_speed_mm_min;
    }

    public void setMax_feed_speed_mm_min(double max_feed_speed_mm_min) {
        this.max_feed_speed_mm_min = max_feed_speed_mm_min;
    }

    public double getMax_holding_torque_N_m() {
        return max_holding_torque_N_m;
    }

    public void setMax_holding_torque_N_m(double max_holding_torque_N_m) {
        this.max_holding_torque_N_m = max_holding_torque_N_m;
    }

    public double getBest_surface_roughness_um() {
        return best_surface_roughness_um;
    }

    public void setBest_surface_roughness_um(double best_surface_roughness_um) {
        this.best_surface_roughness_um = best_surface_roughness_um;
    }

    public double getBest_surface_accuracy_mm() {
        return best_surface_accuracy_mm;
    }

    public void setBest_surface_accuracy_mm(double best_surface_accuracy_mm) {
        this.best_surface_accuracy_mm = best_surface_accuracy_mm;
    }

    public double getBest_storage_capacity() {
        return best_storage_capacity;
    }

    public void setBest_storage_capacity(double best_storage_capacity) {
        this.best_storage_capacity = best_storage_capacity;
    }

    public List<String> getSpindle_interface() {
        return spindle_interface;
    }

    public void setSpindle_interface(List<String> spindle_interface) {
        this.spindle_interface = spindle_interface;
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
        return "manufacturing_cell{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", device_model='" + device_model + '\'' +
                ", operating_system='" + operating_system + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", process_type=" + process_type +
                ", workspace_mm=" + workspace_mm +
                ", max_dimensions_of_workpiece_mm=" + max_dimensions_of_workpiece_mm +
                ", ability_of_multiaspect=" + ability_of_multiaspect +
                ", ability_of_processing_unrotated_part=" + ability_of_processing_unrotated_part +
                ", durable_weight_kg=" + durable_weight_kg +
                ", max_rotated_speed_rpm=" + max_rotated_speed_rpm +
                ", max_feed_speed_mm_min=" + max_feed_speed_mm_min +
                ", max_holding_torque_N_m=" + max_holding_torque_N_m +
                ", best_surface_roughness_um=" + best_surface_roughness_um +
                ", best_surface_accuracy_mm=" + best_surface_accuracy_mm +
                ", best_storage_capacity=" + best_storage_capacity +
                ", spindle_interface=" + spindle_interface +
                ", bus_interface=" + bus_interface +
                ", data_protocol=" + data_protocol +
                ", mFactor=" + mFactor +
                ", tFactor=" + tFactor +
                ", max_power_kW=" + max_power_kW +
                '}';
    }
}
