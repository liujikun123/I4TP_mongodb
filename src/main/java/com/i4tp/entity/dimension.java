package com.i4tp.entity;

public class dimension {
    private Double x;
    private Double y;
    private Double h;
    private Double phi;
    private String M;

    public dimension() {
    }

    public dimension(double x, double y, double h, double phi, String m) {
        this.x = x;
        this.y = y;
        this.h = h;
        this.phi = phi;
        M = m;
    }

    public Double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public Double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public Double getH() {
        return h;
    }

    public void setH(double h) {
        this.h = h;
    }

    public Double getPhi() {
        return phi;
    }

    public void setPhi(double phi) {
        this.phi = phi;
    }

    public String getM() {
        return M;
    }

    public void setM(String m) {
        M = m;
    }

    @Override
    public String toString() {
        return "dimension{" +
                "x=" + x +
                ", y=" + y +
                ", h=" + h +
                ", phi=" + phi +
                ", M='" + M + '\'' +
                '}';
    }
}
