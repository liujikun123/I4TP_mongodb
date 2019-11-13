package com.i4tp.controller;


import javax.servlet.http.HttpServletRequest;

import com.i4tp.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.*;

import com.i4tp.dao.IUserDao;
import com.i4tp.util.TmStringUtils;
import org.n52.matlab.control.*;






/**
 * Controller层，作为请求转发
 * 页面所有路径的访问方法:控制层的命名空间+@RequestMapping的value
 * */
@Controller
@RequestMapping("/index")
public class KrryController {

	@Autowired
	private IUserDao userDao;
    private MatlabProxyFactory factory = new MatlabProxyFactory();
    private MatlabProxy proxy = factory.getProxy();

    public KrryController() throws MatlabConnectionException {
    }

    /**
	 * 进入首页
	 * @return
	 */
	@RequestMapping(value="/index")
	public String index() throws MatlabConnectionException, MatlabInvocationException {

            double p = 2;
            Object[] result1 = proxy.returningFeval("demo",1,p);//这里有很多参数，仅保留部分参数供大家理解用。proxy.returningFeva方法是执行m文件。
            double[] r=(double[]) result1[0];
            System.out.println(r[0]);

		return "index/index";   //默认是转发，不会显示转发路径
	}

    /**
     * 进入首页
     * @return
     */
    @RequestMapping(value="/gotoProduct")
    public String gotoProduct(){

        return "index/product";   //默认是转发，不会显示转发路径
    }
    /**
     * 前往创建新零件页面
     * com.krry.controller.gotoPartCreat
     * 方法名：gotoPartCreat
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(value="/gotoPartCreat")
    public String gotoPartCreat(HttpServletRequest request){
//载入材料种类
            List<material_type> type = userDao.get_material_type();
            request.getSession().setAttribute("material_type", type);
        return "index/partCreat";
    }
    /**
     * 创建新零件
     * com.krry.controller.partCreat
     * 方法名：partCreat
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(method=RequestMethod.POST,value="/process2")
    public String partCreat(HttpServletRequest request){

        //获取用户和密码
        String partName = request.getParameter("partName");
        double part_x = Double.parseDouble(request.getParameter("part_x"));
        double part_y = Double.parseDouble(request.getParameter("part_y"));
        double part_z = Double.parseDouble(request.getParameter("part_z"));
        workpiece_dimensions part_dimensions = new workpiece_dimensions(part_x,part_y,part_z);
        String material = request.getParameter("material_type");
        double workpiece_weight_kg = Double.parseDouble(request.getParameter("workpiece_weight_kg"));
        Boolean multiaspect = Boolean.parseBoolean(request.getParameter("multiaspect"));
        Boolean rotation = Boolean.parseBoolean(request.getParameter("rotation"));
        //如果邮箱和密码为null,那么就返回已null标识
        if(TmStringUtils.isEmpty(partName) )return "index/allError";

        //执行到这里，说明可以注册

        Part newPart = new Part(partName, part_dimensions,material,workpiece_weight_kg,multiaspect,rotation);
        //调用注册方法
        userDao.saveOrUpdateUser(newPart);
        //将信息设置session作用域
        request.getSession().setAttribute("productId", newPart.getId());
       // System.out.println(newPart.getId().length());
        String process = newPart.getProcess();
        request.getSession().setAttribute("process",process );
        return "index/process";
    }


    /**
     * 前往选择零件页面
     * com.krry.controller.gotoPartSelect
     * 方法名：gotoPartCreat
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(value="/gotoPartSelect")
    public String gotoPartSelect(HttpServletRequest request){
//载入所有零件
        List<Part> type = userDao.get_allParts();
        request.getSession().setAttribute("allPart", type);
        return "index/partSelect";
    }

    /**
     * 选择已有零件
     * com.krry.controller.partSelect
     * 方法名：partSelect
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(method=RequestMethod.POST,value="/process")
    public String partSelect(HttpServletRequest request){
        request.getSession().removeAttribute("allPart");
        String product = request.getParameter("production");
        String productId = product.substring(3, 27);
        request.getSession().setAttribute("productId",productId );
     //   System.out.println(product.substring(3, 27).length());
        Part selectProduct = userDao.findById(productId);
        String process = selectProduct.getProcess();
        List<process> selectProcess = userDao.findByName(process);
        List<process_type> allProcessType = userDao.findAllProcessType();
        List<product_feature_type> allFeatureType = userDao.findAllFeatureType();
        request.getSession().setAttribute("process", selectProcess);
        request.getSession().setAttribute("allProcessType", allProcessType);
        request.getSession().setAttribute("allFeatureType", allFeatureType);
        if(selectProcess.size() != 0) {
            return "index/process";
        }
        else{
            return "index/processCreat";
        }

    }

    /**
     * 选择工艺,读取所有机床信息，得到其中所有的操作系统
     * com.krry.controller.processSelect
     * 方法名：processSelect
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(method=RequestMethod.POST,value="/operatingSystemSelect")
    public String processSelect(HttpServletRequest request){

        String processSelect = request.getParameter("p_inf");

        String processSelect2 = request.getParameter("p_inf2");

        List<String> allOperatingSystem = new ArrayList();;
        List<manufacturing_cell> manufacturing = userDao.get_alleManufacturingCell();
        for(int i = 0; i < manufacturing.size(); i++){
            String operatingSystem = manufacturing.get(i).getOperating_system();
            allOperatingSystem.add(i,operatingSystem);
        }
        request.getSession().setAttribute("allOperatingSystem",allOperatingSystem );
        if(processSelect2 != ""){
            return "index/operatingSystemSelect";
        }
        String process_name = request.getParameter("process_name");
        String[] oneStep = processSelect.split("\n");
        for (int i = 0; i < oneStep.length; i++) {
            String[] oneStep2=oneStep[i].split("\\:|,");
            for (int j = 0; j < oneStep2.length; j++) {
            }
            String feature_type = oneStep2[1];
            String process_type = oneStep2[3];
            List<Double> feature_number = new ArrayList<Double>();
            feature_number.add(Double.parseDouble(oneStep2[5].toString()));
            List<Double> base_plane_number = new ArrayList<Double>();
            base_plane_number.add(Double.parseDouble(oneStep2[7].toString()));
            Double dimension_x ;
            Double dimension_y ;
            Double dimension_phi ;
            Double dimension_h ;
            Double machining_accuracy_mm ;
            if(oneStep2[9].equals("")){
                 dimension_x = 0.0;
            }
            else {
                 dimension_x =  Double.parseDouble(oneStep2[9].toString());
            }
            if(oneStep2[11].equals("")){
                 dimension_y = 0.0;
            }
            else {
                 dimension_y =  Double.parseDouble(oneStep2[11].toString());
            }
            if(oneStep2[13].equals("")){
                 dimension_phi = 0.0;
            }
            else {
                 dimension_phi =  Double.parseDouble(oneStep2[13].toString());
            }
            if(oneStep2[15].equals("")){
                 dimension_h = 0.0;
            }
            else {
                 dimension_h =  Double.parseDouble(oneStep2[15].toString());
            }
            if(oneStep2[17].equals("")){
                 machining_accuracy_mm = 0.0;
            }
            else {
                 machining_accuracy_mm =  Double.parseDouble(oneStep2[17].toString());
            }
            String surface_roughness_um = oneStep2[19];
            String dimension_M = "";
            dimension dimension = new dimension(dimension_x, dimension_y,dimension_phi,dimension_h, dimension_M);
            process finalProcess = new process(process_name, i,  feature_type,  process_type, feature_number,
                    base_plane_number,  dimension, machining_accuracy_mm,surface_roughness_um);
          //  System.out.println(process_name);
            userDao.saveOrUpdateUser(finalProcess);

        }

//        request.getSession().setAttribute("processSelect",processSelect );

        return "index/operatingSystemSelect";
    }

    /**
     * 选择工艺,读取所有机床信息，得到其中所有的操作系统
     * com.krry.controller.processSelect
     * 方法名：processSelect
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(method=RequestMethod.GET,value="/gotooperatingSystemSelect")
    public String gotooperatingSystemSelect(HttpServletRequest request){
        return "index/operatingSystemSelect";
        }

    /**
     * 选择操作系统,并载入所有MES系统
     * com.krry.controller.operatingSystem
     * 方法名：operatingSystem
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(method=RequestMethod.POST,value="/mesSelect")
    public String operatingSystem(HttpServletRequest request){

        List<String> operatingSystem = Arrays.asList(request.getParameterValues("operatingSystem"));

        request.getSession().setAttribute("operatingSystem",operatingSystem );

        List<String> allControlCell = new ArrayList();;
        List<control_cell> control_cell = userDao.get_control_cell();
        for(int i = 0; i < control_cell.size(); i++){
            String controlCell = control_cell.get(i).getName();
            allControlCell.add(i,controlCell);
        }
        request.getSession().setAttribute("allControlCell",allControlCell );
        return "index/mesSelect";
    }

    /**
     * 其他需求
     * com.krry.controller.otherRequest
     * 方法名：otherRequest
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(method=RequestMethod.POST,value="/otherRequest")
    public String otherRequest(HttpServletRequest request){
        return "index/otherRequest";
    }
    /**
     * 其他需求
     * com.krry.controller.otherRequest
     * 方法名：otherRequest
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(method=RequestMethod.POST,value="/success")
    public String success(HttpServletRequest request){
        return "index/success";
    }

    /**
     * 其他需求
     * com.krry.controller.processCreat
     * 方法名：otherRequest
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(method=RequestMethod.GET,value="/processCreat")
    public String processCreat(HttpServletRequest request){
        return "index/processCreat";
    }
    /**
     * 其他需求
     * com.krry.controller.processSelect2
     * 方法名：otherRequest
     * @author kunkun
     * @param request
     * @return string
     * @exception
     * @since  1.0.0
     */
    @RequestMapping(method=RequestMethod.GET,value="/processSelect2")
    public String processSelect2(HttpServletRequest request){
        return "index/process";
    }

}

//	/**
//	 * 进入登录界面
//	 * @return
//	 */
//	@RequestMapping("/login")
//	public String login(){
//
//		return "index/login";   //默认是转发，不会显示转发路径
//	}
//
//
//
//	/**
//	 * 点击登录
//	 * com.krry.controller.login
//	 * 方法名：login
//	 * @author krry
//	 * @param request
//	 * @return String
//	 * @exception
//	 * @since  1.0.0
//	 */
//	@RequestMapping(method=RequestMethod.POST,value="/logined")
//	public String login(HttpServletRequest request){
//		//获取用户和密码
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//
//		//如果邮箱和密码为null,那么就返回已null标识
//		if(TmStringUtils.isEmpty(username)) return "index/allError";
//		if(TmStringUtils.isEmpty(password)) return "index/allError";
//
//		//根据邮箱或昵称查询，用户是否存在
//		User user = userDao.findByUsername(username);
//
//		//如果存在
//		if(user!=null){
//
//			if(password.equals(user.getPassword())){
//				//如果密码正确
//				//将用户信息放入到会话中...
//				request.getSession().setAttribute("user", user);
//
//				//这里使用重定向 ,重定向到当前命名空间下@RequestMapping是index的方法
//				return "redirect:index";
//			}else{
//				//如果密码错误
//				System.out.println("密码错误");
//				return "index/error";
//			}
//		}else{
//			//如果不存在，代码邮箱和密码输入有误
//			System.out.println("用户不存在");
//			return "index/error";
//		}
//	}
//
//	/**
//	 * 退出登录控制层
//	 * com.krry.controller.login
//	 * 方法名：logout
//	 * @author krry
//	 * @param request
//	 * @return String
//	 * @exception
//	 * @since  1.0.0
//	 */
//	@RequestMapping(method=RequestMethod.GET,value="/logout")
//	public String logout(HttpServletRequest request){
//		request.getSession().invalidate(); //清空session值
//		return "index/index";
//	}
//
//	/**
//	 * 打开注册界面层
//	 * @return
//	 */
//	@RequestMapping("/rege")
//	public String rege(){
//
//		return "index/resgi";
//	}
//
//	/**
//	 * 注册控制层
//	 * com.krry.controller.login
//	 * 方法名：resig
//	 * @author krry
//	 * @param request
//	 * @return String
//	 * @exception
//	 * @since  1.0.0
//	 */
//	@RequestMapping(method=RequestMethod.POST,value="/resig")
//	public String resig(HttpServletRequest request){
//		//获取用户和密码
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//
//		//如果邮箱和密码为null,那么就返回已null标识
//		if(TmStringUtils.isEmpty(username) )return "index/allError";
//		if(TmStringUtils.isEmail(password))return "index/allError";
//
//		//根据昵称查询，用户是否存在
//		User user = userDao.findByUsername(username);
//
//		//若存在
//		if(user != null){ //昵称重复
//			return "index/allError";
//		}
//
//		//格式化时间类型
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String nowTime = sdf.format(new Date());
//
//		//执行到这里，说明可以注册
//		User newUser = new User(username, password, nowTime);
//		//调用注册方法
//		userDao.saveOrUpdateUser(newUser);
//
//		//将信息设置session作用域
//		request.getSession().setAttribute("user", newUser);
//
//		return "redirect:index";
//	}
//


