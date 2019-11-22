package com.i4tp.core;

import com.i4tp.entity.*;

import java.util.Optional;

public class processwork {
    public double work(process process) {
        Double work;
        String typeOfName = process.getProcess_type();
        dimension workSize = process.getDimension();
        if (typeOfName.equals("milling")) {
            if (workSize.getX() != null) {
                work = workSize.getX() * workSize.getY();
            } else {
                work = workSize.getH();
            }
        } else {
            work = workSize.getH();
        }
        return work;
    }
}
