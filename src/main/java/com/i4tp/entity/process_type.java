package com.i4tp.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "process_type")
public class process_type {

    @Id
    private String id;
    private String process_type;
    private String tool_class;
    private Double pFactor = 1.0;


    public process_type() {
    }

    public process_type(String process_type) {
        this.process_type = process_type;
    }

    public process_type(String process_type, String tool_class, Double pFactor) {
        this.process_type = process_type;
        this.tool_class = tool_class;
        this.pFactor = pFactor;
    }

    public Double getpFactor() {
        return pFactor;
    }

    public void setpFactor(Double pFactor) {
        this.pFactor = pFactor;
    }

    public String getProcess_type() {
        return process_type;
    }

    public void setProcess_type(String process_type) {
        this.process_type = process_type;
    }

    public String getTool_class() {
        return tool_class;
    }

    public void setTool_class(String tool_class) {
        this.tool_class = tool_class;
    }

    @Override
    public String toString() {
        return "process_type{" +
                "id='" + id + '\'' +
                ", process_type='" + process_type + '\'' +
                ", tool_class='" + tool_class + '\'' +
                ", pFactor=" + pFactor +
                '}';
    }
}


