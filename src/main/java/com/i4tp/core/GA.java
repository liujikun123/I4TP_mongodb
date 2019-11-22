package com.i4tp.core;
import java.util.*;
import com.i4tp.entity.*;
import io.jenetics.*;
import io.jenetics.engine.*;
import java.util.ArrayList;
import java.util.List;


//遗传算法
public class GA {

    private static List<Double> timeByMachine = new ArrayList<>();
    private static int productsNum;
    private static List<String> processName = new ArrayList<>();
    private static List<List<manufacturing_cell>> solveSpace = new ArrayList<>();
    private static List<List<String>> nameOfSolveSpace = new ArrayList<>();

    //定义舒适度函数
    private static Integer fitness(Genotype<IntegerGene> genotype) {
        int[] fitnessArray = genotype.getChromosome()
                .as(IntegerChromosome.class)
                .toArray();
        int fitValue = 0;
        int k = 0;
        int i = 0;
        double sumProducts = 0;
        for (Integer value : fitnessArray) {
            int j = nameOfSolveSpace.get(i).size();
            fitValue += fitnessArray[value] * timeByMachine.get(value);
            sumProducts += fitnessArray[value] * 60.0 * 16.0 * 24.0 / timeByMachine.get(value);
            k++;
            //车床数量上限
//            if (value > 7) {
//                fitValue += 100000000;
//            }
            //产能要求
            if (k == j) {
                if (sumProducts < productsNum ) {
                    fitValue += 1000000;
                }
                i += 1;
                k = 0;
                sumProducts = 0;
            }
        }
        return fitValue;
    }

    public void main(List<manufacturing_cell> manufacturing,
                     List<process> allProcess,
                     List<process_type> allType,
                     int productsNum2) {
        productsNum = productsNum2;
        Map<String, Double> allpFactor = new HashMap<>();
        Map<String, Double> allmFactor = new HashMap<>();
        Map<String, Double> alltFactor = new HashMap<>();
        //工艺系数初始化
        for (com.i4tp.entity.process_type process_type : allType) {
            allpFactor.put(process_type.getProcess_type(), process_type.getpFactor());
        }
        //机床和刀具系数初始化
        for (com.i4tp.entity.manufacturing_cell manufacturing_cell : manufacturing) {
            allmFactor.put(manufacturing_cell.getName(), manufacturing_cell.getmFactor());
            alltFactor.put(manufacturing_cell.getName(), manufacturing_cell.gettFactor());
        }
        for (process value : allProcess) {
            processName.add(value.getProcess_type());
        }
        //将满足加工能力的机床分类,可以用LAMBDA表达式改写
        int geneLength = 0;
        for (int i = 0; i < processName.size(); i++) {
            solveSpace.add(new ArrayList<>());
            nameOfSolveSpace.add(new ArrayList<>());
            String oneProcessName = processName.get(i);
            for (com.i4tp.entity.manufacturing_cell manufacturing_cell : manufacturing) {
                List<String> pType = manufacturing_cell.getProcess_type();
                for (String s : pType) {
                    if (s.equals(oneProcessName)) {
                        solveSpace.get(i).add(manufacturing_cell);
                        nameOfSolveSpace.get(i).add(manufacturing_cell.getName());
                        geneLength++;
                    }
                }
            }
        }

        System.out.println(processName);
        System.out.println(nameOfSolveSpace);
        //计算所有工艺在不同机床上不同的加工时间
        for (int i = 0; i < processName.size(); i++) {
            double work = new processwork().work(allProcess.get(i));
            for (int j = 0; j < solveSpace.get(i).size(); j++) {
                String typeOfProcess = processName.get(i);
                String nameOfMachine = solveSpace.get(i).get(j).getName();
                Double pFactor = allpFactor.get(typeOfProcess);
                Double mFactor = allmFactor.get(nameOfMachine);
                Double tFactor = alltFactor.get(nameOfMachine);
                Double processTime = work * pFactor * mFactor * tFactor;
                timeByMachine.add(processTime);
            }
        }
//
////
        System.out.println(timeByMachine);
        //定义基因型和初始种群
        Genotype<IntegerGene> gtf = Genotype.of(IntegerChromosome.of(0, 3, geneLength));
//        System.out.println(gtf);

        // 3.)创建Engine
        Engine<IntegerGene, Integer> engine = Engine
                .builder(GA::fitness, gtf)//事先定义好的舒适度函数和原始种群
                .populationSize(500)
                .survivorsSelector(new TournamentSelector<>(5))
                .offspringSelector(new RouletteWheelSelector<>())
                .alterers(
                        new Mutator<>(0.115),
                        new SinglePointCrossover<>(0.16))
//                .maximalPhenotypeAge(70)//种群最大年龄
//                .offspringFraction(0.6)//后代占种群的比例
//                .populationSize(500)//种群大小
//                .selector(new RouletteWheelSelector<>())//选择器
//                .alterers(new Mutator<>(0.9),
//                        new SinglePointCrossover<>(0.01))//变异器
                .optimize(Optimize.MINIMUM)//舒适度函数优化目标
                .build();


        final EvolutionStatistics<Integer, ?> statistics = EvolutionStatistics.ofNumber();//创建一个实体，存放统计数据
        //        // 4.) 创建EvolutionStream开始进化，得到结果
        final Phenotype<IntegerGene, Integer> result = engine.stream()
                .limit(Limits.bySteadyFitness(20))//若10代稳定不变，结束
                .limit(500)//进化500代结束
                .peek(statistics)//保存统计数据
                .collect(EvolutionResult.toBestPhenotype());
//
        System.out.println(statistics);
        System.out.println(result);
        timeByMachine.clear();
        processName.clear();
        solveSpace.clear();
        nameOfSolveSpace.clear();

    }
}