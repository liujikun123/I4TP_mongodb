package com.i4tp.core;

import io.jenetics.IntegerGene;
import io.jenetics.Phenotype;

import java.util.List;
//遗传算法结果封装
public class GAResult {
    private Phenotype<IntegerGene, Integer> result;
    private List<String> processName;
    private List<List<String>> nameOfSolveSpace;

    public GAResult() {
    }

    public GAResult(Phenotype<IntegerGene, Integer> result, List<String> processName, List<List<String>> nameOfSolveSpace) {
        this.result = result;
        this.processName = processName;
        this.nameOfSolveSpace = nameOfSolveSpace;
    }

    public Phenotype<IntegerGene, Integer> getResult() {
        return result;
    }

    public void setResult(Phenotype<IntegerGene, Integer> result) {
        this.result = result;
    }

    public List<String> getProcessName() {
        return processName;
    }

    public void setProcessName(List<String> processName) {
        this.processName = processName;
    }

    public List<List<String>> getNameOfSolveSpace() {
        return nameOfSolveSpace;
    }

    public void setNameOfSolveSpace(List<List<String>> nameOfSolveSpace) {
        this.nameOfSolveSpace = nameOfSolveSpace;
    }

    @Override
    public String toString() {
        return "GAResult{" +
                "result=" + result +
                ", processName=" + processName +
                ", nameOfSolveSpace=" + nameOfSolveSpace +
                '}';
    }
}
