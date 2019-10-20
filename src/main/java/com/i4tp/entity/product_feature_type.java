package com.i4tp.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "product_feature_type")
public class product_feature_type {

    @Id
    private String id;
    private String product_feature_type;

    public product_feature_type() {
    }

    public product_feature_type(String product_feature_type) {
        this.product_feature_type = product_feature_type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProduct_feature_type() {
        return product_feature_type;
    }

    public void setProduct_feature_type(String product_feature_type) {
        this.product_feature_type = product_feature_type;
    }

    @Override
    public String toString() {
        return "product_feature_type{" +
                "id='" + id + '\'' +
                ", product_feature_type='" + product_feature_type + '\'' +
                '}';
    }
}
