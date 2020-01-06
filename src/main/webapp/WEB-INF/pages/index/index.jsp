<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh"><!--<![endif]-->
<head>
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
        %>
    <meta name="viewport" content="width=1200">
    <link href="<%=cssPath%>/files/bc.css" rel="stylesheet">
    <link href="<%=cssPath%>/files/wifi.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <script src="<%=cssPath%>/resource/js/three-r93.js"></script>
    <script src="<%=cssPath%>/resource/js/Detector.js"></script>
    <script src="<%=cssPath%>/resource/js/GLTFLoader.js"></script>
    <script src="<%=cssPath%>/resource/js/OrbitControls.js"></script>
    <script src="<%=cssPath%>/resource/js/stats.min.js"></script>
    <script src="<%=cssPath%>/resource/js/dat.gui.min.js"></script>
</head>
<body>
<div id="hd0">
    <div class="mod-head clearfix">
        <h1 id="logo"><img src="../../../files/logo.png" alt="LOGO"></h1>
        <div id="nav">
            <ul>
                <li><a href="${basePath}/index/index">I4TP 系统配置与重构平台</a></li>
            </ul>

        </div>
        <div id="userbar">
            <img src="<%=cssPath%>/files/amtc.png" alt="amtc">
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
        <form action="${basePath}/index/upload" method="POST" enctype="multipart/form-data">
            <input type="file" name="file">
            <input type="submit" value="提交">
        </form>




        <div>
            <a>欢迎使用交钥匙工厂生产系统配置与重构平台</a><br><br><br>
            <%--      <canvas id="model" style="width: 300px;height: 300px"></canvas>--%>
        </div>

        <div>
<%--            <div style="margin-bottom:15px;">--%>
<%--                <button type="button" class="btn btn-primary btn-l" onclick=gotoTest()><span>测试按钮</span></button>--%>
<%--            </div>--%>
<%--            <br>--%>
            <div style="margin-bottom:15px;">
                <button type="button" class="btn btn-primary btn-l" onclick=gotoProduct()><span>开始使用</span></button>
            </div>
        </div>
        <div style="padding: 20px 20px 20px;width: 750px">
            <div id="ThreeJS" ></div>
        </div>
    </div>
</div>
</body>
<script>

    let scene, camera, renderer, controls, guiControls,container;
    let stats = initStats();

    /* 场景 */
    function initScene() {

        scene = new THREE.Scene();

    }

    /* 相机 */
    function initCamera() {

        camera = new THREE.PerspectiveCamera(45, 750 / 450, 0.1, 10000);
        // camera = new THREE.OrthographicCamera( width / - 2, width / 2, height / 2, height / - 2, 1, 1000 );
        camera.position.set(100, 100, 100);
        camera.lookAt(new THREE.Vector3(0, 0, -100));

    }

    /* 渲染器 */
    function initRender() {

        renderer = new THREE.WebGLRenderer({antialias: true});
        renderer.setSize(750, 450);
        renderer.setClearColor(0x0E3866);
        // renderer.shadowMapEnabled = true;
        // renderer.shadowMapType=THREE.PCFSoftShadowMap;
        // container = document.getElementById("ThreeJS");
        document.getElementById("ThreeJS").appendChild(renderer.domElement);

    }

    /* 灯光 */
    function initLight() {

        scene.add(new THREE.AmbientLight(0xffffff));

    }

    // FLOOR
    function initFloor() {

        let floorTexture = new THREE.ImageUtils.loadTexture( "<%=cssPath%>/resource/img/1.jpg" );
        floorTexture.wrapS = floorTexture.wrapT = THREE.RepeatWrapping;
        floorTexture.repeat.set( 10, 10 );
        let floorMaterial = new THREE.MeshBasicMaterial( { map: floorTexture, side: THREE.DoubleSide } );
        let floorGeometry = new THREE.PlaneGeometry(1000, 1000, 10, 10);
        let floor = new THREE.Mesh(floorGeometry, floorMaterial);
        floor.position.y = -0.5;
        floor.rotation.x = Math.PI / 2;
        scene.add(floor);

    }
    /* 控制器 */
    function initControls() {

        controls = new THREE.OrbitControls(camera, renderer.domElement);

        /* 属性参数默认 */

    }

    /* 调试插件 */
    function initGui() {

        guiControls = new function () {

        };

        let controls = new dat.GUI({width: 200});

    }

    /* 场景中的内容 */
    function initContent() {

        // 加载 glTF 格式的模型
        let loader = new THREE.GLTFLoader();/*实例化加载器*/

        loader.load("<%=cssPath%>/resource/model/amtc1.glb",function (obj) {
            obj.scene.position.x = -1000;
            obj.scene.position.y = -1000;
            obj.scene.position.z = 0;
            scene.add(obj.scene);
        });

    }

    /* 性能插件 */
    function initStats() {

        let stats = new Stats();

        // document.getElementById("ThreeJS").appendChild(stats.domElement);

        return stats;

    }

    /* 窗口变动触发 */
    function onWindowResize() {

        // camera.aspect = window.innerWidth / window.innerHeight;
        // camera.updateProjectionMatrix();
        // renderer.setSize(window.innerWidth, window.innerHeight);

    }

    /* 数据更新 */
    function update() {

        stats.update();

    }

    /* 初始化 */
    function init() {

        initScene();
        initCamera();
        initRender();
        initLight();
        // initFloor();
        initControls();
        initContent();
        // initGui();

        /* 监听事件 */
        window.addEventListener('resize', onWindowResize, false);

    }

    /* 循环渲染 */
    function animate() {

        requestAnimationFrame(animate);
        renderer.render(scene, camera);
        update();

    }

    /* 初始加载 */
    (function () {
        console.log("three init start...");

        init();
        animate();

        console.log("three init send...");
    })();

    function gotoProduct() {
        window.location.href = "${basePath}/index/gotoProduct";
    }

    function gotoTest() {
        window.location.href = "${basePath}/index/gotoTest";
    }
</script>
</html>