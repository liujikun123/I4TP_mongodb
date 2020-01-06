<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh"><!--<![endif]-->
<head>

    <%
        String cssPath = request.getContextPath();
    %>
    <title>Imported Model (Three.js)</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <link rel=stylesheet href="<%=cssPath%>/files/base.css"/>


    <script src="<%=cssPath%>/resource/js/three-r93.js"></script>
    <script src="<%=cssPath%>/resource/js/Detector.js"></script>
    <script src="<%=cssPath%>/resource/js/GLTFLoader.js"></script>
    <script src="<%=cssPath%>/resource/js/OrbitControls.js"></script>
    <script src="<%=cssPath%>/resource/js/stats.min.js"></script>
    <script src="<%=cssPath%>/resource/js/dat.gui.min.js"></script>


<%--    <!-- jQuery code to display an information button and box when clicked. -->--%>
<%--    <script src="<%=cssPath%>/resource/js/jquery-1.9.1.js"></script>--%>
<%--    <script src="<%=cssPath%>/resource/js/jquery-ui.js"></script>--%>
<%--    <link rel=stylesheet href="<%=cssPath%>/files/jquery-ui.css" />--%>
<%--    <link rel=stylesheet href="<%=cssPath%>/files/info.css"/>--%>
<%--    <script src="<%=cssPath%>/resource/js/info.js"></script>--%>
</head>
<body>

<%--<div id="infoButton"></div>--%>
<%--<div id="infoBox" title="Demo Information">--%>
<%--    This three.js demo is part of a collection at--%>
<%--    <a href="http://stemkoski.github.io/Three.js/">http://stemkoski.github.io/Three.js/</a>--%>
<%--</div>--%>
<!-- ------------------------------------------------------------ -->

<div id="ThreeJS" style="position: absolute; left:0; top:0"></div>
<script>

    let scene, camera, renderer, controls, guiControls,container;
    let stats = initStats();

    /* 场景 */
    function initScene() {

        scene = new THREE.Scene();

    }

    /* 相机 */
    function initCamera() {

        camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 10000);
        camera.position.set(50, 50, 50);
        camera.lookAt(new THREE.Vector3(0, 0, 0));

    }

    /* 渲染器 */
    function initRender() {

        renderer = new THREE.WebGLRenderer({antialias: true});
        renderer.setSize(window.innerWidth, window.innerHeight);
        renderer.setClearColor(0x0E3866);
        // renderer.shadowMapEnabled = true;
        // renderer.shadowMapType=THREE.PCFSoftShadowMap;
        container = document.getElementById("ThreeJS");
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

        loader.load("<%=cssPath%>/resource/model/small.glb",function (obj) {
            obj.scene.position.x = 20;
            obj.scene.position.y = 20;
            obj.scene.position.z = 20;
            scene.add(obj.scene);
        });

    }

    /* 性能插件 */
    function initStats() {

        let stats = new Stats();

        document.getElementById("ThreeJS").appendChild(stats.domElement);

        return stats;

    }

    /* 窗口变动触发 */
    function onWindowResize() {

        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);

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
        initFloor();
        initControls();
        initContent();
        initGui();

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

</script>

</body>
</html>
