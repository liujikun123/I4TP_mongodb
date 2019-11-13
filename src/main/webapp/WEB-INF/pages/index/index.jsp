<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh"><!--<![endif]--><head>
  <meta http-equiv="X-UA-Compatible" content="edge">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="renderer" content="webkit">
  <style>
    body {
      filter: none;
    }
  </style>
  <title>首页</title>

  <%
    String cssPath = request.getContextPath();
    String resourcePath = request.getContextPath() + "/resource";
    String cssBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
  <meta name="viewport" content="width=1200">
  <link href="<%=cssPath%>/files/bc.css" rel="stylesheet">
  <link href="<%=cssPath%>/files/wifi.css" rel="stylesheet">
  <script src="<%=resourcePath%>/js/Three.js"></script>
  <script src="<%=resourcePath%>/js/STLLoader.js"></script>
  <script src="<%=resourcePath%>/js/OrbitControls.js"></script>
  <script src="<%=resourcePath%>/js/stats.min.js"></script>
  <script src="<%=resourcePath%>/js/dat.gui.min.js"></script>
  <script src="<%=resourcePath%>/js/Detector.js"></script>
  <script src="<%=resourcePath%>/js/Stats.js"></script>
  <script src="<%=resourcePath%>/js/THREEx.KeyboardState.js"></script>
  <script src="<%=resourcePath%>/js/THREEx.FullScreen.js"></script>
  <script src="<%=resourcePath%>/js/THREEx.WindowResize.js"></script>
<%--  <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>--%>

  <style type="text/css">
  </style>
</head>
  <body>
  <div id="hd0">
  <div class="mod-head clearfix">
    <h1 id="logo"><img src="../../../files/logo.png" alt="LOGO" ></h1>
    <div id="nav">
      <ul>
        <li><a href="${basePath}/index/index">I4TP 系统配置与重构平台</a></li>
      </ul>

    </div>
    <div id="userbar">
      <img src="../../../files/amtc.png" alt="amtc">
    </div>
  </div>
  </div>

  <div id="allPage">
  <div id="hd">
    <div class="inner">

      <div class="mod-set-nav">
        <ul class="clearfix li-5">
          <li>
            <a>
              <i class="ico ico-1"></i>
              <span>产品参数</span>
            </a>
          </li>
          <li>
            <a>
              <i class="ico ico-2"></i>
              <span>工艺参数</span>
            </a>
          </li>
          <li>
            <a>
              <i class="ico ico-3"></i>
              <span>操作系统选择</span>
            </a>
          </li>
          <li>
            <a>
              <i class="ico ico-4"></i>
              <span>MES选择</span>
            </a>
          </li>
          <li>
            <a>
              <i class="ico ico-5"></i>
              <span>用户需求</span>
            </a>
          </li>
          <li>
            <a>
              <i class="ico ico-6"></i>
              <span>明细浏览</span>
            </a>
          </li>
          <li>
            <a>
              <i class="ico ico-7"></i>
              <span>配置生成</span>
            </a>
          </li>
        </ul>
      </div>

    </div>
  </div>

  <div id="bd" style="height:auto;width: 800px;text-align: center">
    <br>

    <div>
      <a>欢迎使用交钥匙工厂生产系统配置与重构平台</a><br><br><br>
<%--      <canvas id="model" style="width: 300px;height: 300px"></canvas>--%>
    </div>

    <div>
        <div style="margin-bottom:15px;"><button type="button" class="btn btn-primary btn-l" onclick=gotoProduct()><span>开始使用</span></button></div>
  </div>
  </div>
  </div>
  </body>

<script type="text/javascript" >
  function gotoProduct(){
    window.location.href="${basePath}/index/gotoProduct";
  }
  /*
      Three.js "tutorials by example"
      Author: Lee Stemkoski
      Date: July 2013 (three.js v59dev)
  */

  // MAIN

  // standard global variables
  <%--var container, scene, camera, renderer, controls, stats;--%>
  <%--var keyboard = new THREEx.KeyboardState();--%>
  <%--var clock = new THREE.Clock();--%>

  <%--// custom global variables--%>
  <%--var android;--%>

  <%--init();--%>
  <%--animate();--%>

  <%--// FUNCTIONS--%>
  <%--function init()--%>
  <%--{--%>
  <%--  // SCENE--%>
  <%--  scene = new THREE.Scene();--%>
  <%--  // CAMERA--%>
  <%--  var SCREEN_WIDTH = window.innerWidth, SCREEN_HEIGHT = window.innerHeight;--%>
  <%--  var VIEW_ANGLE = 45, ASPECT = SCREEN_WIDTH / SCREEN_HEIGHT, NEAR = 0.1, FAR = 20000;--%>
  <%--  camera = new THREE.PerspectiveCamera( VIEW_ANGLE, ASPECT, NEAR, FAR);--%>
  <%--  scene.add(camera);--%>
  <%--  camera.position.set(0,150,400);--%>
  <%--  camera.lookAt(scene.position);--%>
  <%--  // RENDERER--%>
  <%--  if ( Detector.webgl )--%>
  <%--    renderer = new THREE.WebGLRenderer( {antialias:true} );--%>
  <%--  else--%>
  <%--    renderer = new THREE.CanvasRenderer();--%>
  <%--  renderer.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);--%>
  <%--  container = document.getElementById( 'model' );--%>
  <%--  container.appendChild( renderer.domElement );--%>
  <%--  // EVENTS--%>
  <%--  THREEx.WindowResize(renderer, camera);--%>
  <%--  THREEx.FullScreen.bindKey({ charCode : 'm'.charCodeAt(0) });--%>
  <%--  // CONTROLS--%>
  <%--  controls = new THREE.OrbitControls( camera, renderer.domElement );--%>
  <%--  // STATS--%>
  <%--  stats = new Stats();--%>
  <%--  stats.domElement.style.position = 'absolute';--%>
  <%--  stats.domElement.style.bottom = '0px';--%>
  <%--  stats.domElement.style.zIndex = "100";--%>
  <%--  container.appendChild( stats.domElement );--%>
  <%--  // LIGHT--%>
  <%--  var light = new THREE.PointLight(0xffffff);--%>
  <%--  light.position.set(-100,200,100);--%>
  <%--  scene.add(light);--%>
  <%--  // FLOOR--%>
  <%--  var floorTexture = new THREE.ImageUtils.loadTexture( '<%=cssPath%>/images/1.jpg' );--%>
  <%--  floorTexture.wrapS = floorTexture.wrapT = THREE.RepeatWrapping;--%>
  <%--  floorTexture.repeat.set( 10, 10 );--%>
  <%--  var floorMaterial = new THREE.MeshBasicMaterial( { map: floorTexture, side: THREE.DoubleSide } );--%>
  <%--  var floorGeometry = new THREE.PlaneGeometry(1000, 1000, 10, 10);--%>
  <%--  var floor = new THREE.Mesh(floorGeometry, floorMaterial);--%>
  <%--  floor.position.y = -0.5;--%>
  <%--  floor.rotation.x = Math.PI / 2;--%>
  <%--  scene.add(floor);--%>
  <%--  // SKYBOX/FOG--%>
  <%--  var skyBoxGeometry = new THREE.CubeGeometry( 10000, 10000, 10000 );--%>
  <%--  var skyBoxMaterial = new THREE.MeshBasicMaterial( { color: 0x9999ff, side: THREE.BackSide } );--%>
  <%--  var skyBox = new THREE.Mesh( skyBoxGeometry, skyBoxMaterial );--%>
  <%--  // scene.add(skyBox);--%>
  <%--  scene.fog = new THREE.FogExp2( 0x9999ff, 0.00025 );--%>

  <%--  ////////////--%>
  <%--  // CUSTOM //--%>
  <%--  ////////////--%>

  <%--  // Note: if imported model appears too dark,--%>
  <%--  //   add an ambient light in this file--%>
  <%--  //   and increase values in model's exported .js file--%>
  <%--  //    to e.g. "colorAmbient" : [0.75, 0.75, 0.75]--%>
  <%--  var jsonLoader = new THREE.STLLoader();--%>
  <%--  jsonLoader.load("<%=cssPath%>/images/1.stl", function(geometry){--%>
  <%--  var mat = new THREE.MeshLambertMaterial({color: 0x00ffff});--%>
  <%--  var mesh = new THREE.Mesh(geometry, mat);--%>
  <%--  mesh.rotation.x = -0.5 * Math.PI; //将模型摆正--%>
  <%--  mesh.scale.set(0.1, 0.1, 0.1); //缩放--%>
  <%--  geometry.center(); //居中显示--%>
  <%--  scene.add(mesh);--%>
  <%--});--%>
  <%--  // addModelToScene function is called back after model has loaded--%>

  <%--  var ambientLight = new THREE.AmbientLight(0x111111);--%>
  <%--  scene.add(ambientLight);--%>

  <%--}--%>


  <%--function animate()--%>
  <%--{--%>
  <%--  requestAnimationFrame( animate );--%>
  <%--  render();--%>
  <%--  update();--%>
  <%--}--%>

  <%--function update()--%>
  <%--{--%>
  <%--  if ( keyboard.pressed("z") )--%>
  <%--  {--%>
  <%--    // do something--%>
  <%--  }--%>

  <%--  controls.update();--%>
  <%--  stats.update();--%>
  <%--}--%>

  <%--function render()--%>
  <%--{--%>
  <%--  renderer.render( scene, camera );--%>
  <%--}--%>


</script>
</html>