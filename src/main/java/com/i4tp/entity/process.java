package com.i4tp.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document(collection = "process")
public class process {

    @Id
    private String id;
    private String name;
    private int order;
    private String feature_type;
    private String process_type;
    private List<Double> feature_number;
    private List<Double> base_plane_number;
    private dimension dimension;
    private Double machining_accuracy_mm;
    private String surface_roughness_um;

    public process() {
    }

    public process(String process_type) {
        this.process_type = process_type;
    }

    public process(String name, int order, String feature_type, String process_type, List<Double> feature_number, List<Double> base_plane_number, com.i4tp.entity.dimension dimension, Double machining_accuracy_mm, String surface_roughness_um) {
        this.name = name;
        this.order = order;
        this.feature_type = feature_type;
        this.process_type = process_type;
        this.feature_number = feature_number;
        this.base_plane_number = base_plane_number;
        this.dimension = dimension;
        this.machining_accuracy_mm = machining_accuracy_mm;
        this.surface_roughness_um = surface_roughness_um;
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

    public String getSurface_roughness_um() {
        return surface_roughness_um;
    }

    public void setSurface_roughness_um(String surface_roughness_um) {
        this.surface_roughness_um = surface_roughness_um;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public String getFeature_type() {
        return feature_type;
    }

    public void setFeature_type(String feature_type) {
        this.feature_type = feature_type;
    }

    public String getProcess_type() {
        return process_type;
    }

    public void setProcess_type(String process_type) {
        this.process_type = process_type;
    }

    public List<Double> getFeature_number() {
        return feature_number;
    }

    public void setFeature_number(List<Double> feature_number) {
        this.feature_number = feature_number;
    }

    public List<Double> getBase_plane_number() {
        return base_plane_number;
    }

    public void setBase_plane_number(List<Double> base_plane_number) {
        this.base_plane_number = base_plane_number;
    }

    public com.i4tp.entity.dimension getDimension() {
        return dimension;
    }

    public void setDimension(com.i4tp.entity.dimension dimension) {
        this.dimension = dimension;
    }

    public Double getMachining_accuracy_mm() {
        return machining_accuracy_mm;
    }

    public void setMachining_accuracy_mm(Double machining_accuracy_mm) {
        this.machining_accuracy_mm = machining_accuracy_mm;
    }

    @Override
    public String toString() {
        return "process{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", order=" + order +
                ", feature_type='" + feature_type + '\'' +
                ", process_type='" + process_type + '\'' +
                ", feature_number=" + feature_number +
                ", base_plane_number=" + base_plane_number +
                ", dimension=" + dimension +
                ", machining_accuracy_mm=" + machining_accuracy_mm +
                ", surface_roughness_um='" + surface_roughness_um + '\'' +
                '}';
    }
}
