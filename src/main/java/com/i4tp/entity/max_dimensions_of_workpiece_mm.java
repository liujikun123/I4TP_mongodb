package com.i4tp.entity;

public class max_dimensions_of_workpiece_mm {

    private Double x;
    private Double y;
    private Double z;
    private Double d;

    public max_dimensions_of_workpiece_mm() {
    }

    public max_dimensions_of_workpiece_mm(Double x, Double y, Double z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public max_dimensions_of_workpiece_mm(Double z, Double d) {
        this.z = z;
        this.d = d;
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

    public Double getD() {
        return d;
    }

    public void setD(Double d) {
        this.d = d;
    }

    @Override
    public String toString() {
        return "max_dimensions_of_workpiece_mm{" +
                "x=" + x +
                ", y=" + y +
                ", z=" + z +
                ", d=" + d +
                '}';
    }
}
