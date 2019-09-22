package com.i4tp.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Field;

public class material_type {
    @Id
    private String id;
    @Field("material_type")
    private String material_type;

    public material_type(String material_type) {
        this.material_type = material_type;
    }

    public String getMaterial_type() {
        return material_type;
    }

    public void setMaterial_type(String material_type) {
        this.material_type = material_type;
    }


    @Override
    public String toString() {
        return "material_type{" +
                "material_type='" + material_type + '\'' +
                '}';
    }
}
