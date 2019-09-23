package com.i4tp.entity;

public class workspace_mm {

    private Double x;
    private Double y;
    private Double z;

    public workspace_mm(Double x, Double y, Double z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public Double getX() {
        return x;
    }

    public void setX(Double x) {
        this.x = x;
    }

    public Double getY() {
        return y;
    }

    public void setY(Double y) {
        this.y = y;
    }

    public Double getZ() {
        return z;
    }

    public void setZ(Double z) {
        this.z = z;
    }

    @Override
    public String toString() {
        return "workspace_mm{" +
                "x=" + x +
                ", y=" + y +
                ", z=" + z +
                '}';
    }
}

