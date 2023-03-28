<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CarPoolingMS.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests" />
    <style type="text/css">
        #allmap {width: 500PX;height: 400PX;overflow: hidden;margin:0;margin:0 auto;vertical-align:middle;}
        #input{width:600px;height:50px;margin:0 auto;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=24661721a13ef054b221f80ab69b36e8"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="input">
            <span>出发城市：</span><input id="txtStart" type="text" />
            <span>目的城市：</span><input id="txtEnd" type="text" />
            <input id="btnSearch" type="button" value="搜索线路" onclick="ssClick()" />
            <!-- <input id="btnSearch" type="button" value="搜索线路" onclick="search()" /> -->
        </div>
        <div id="allmap"></div>
    </form>

    <script> 

        // 百度地图API功能
        var map = new BMap.Map("allmap");
        map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
        var driving = new BMap.DrivingRoute(map, { renderOptions: { map: map, autoViewport: true } });
        // var map  =new BMap.Map('container');  
        // map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
        // var driving =new BMap.DrivingRoute(map, {  renderOptions: {   map: map,  panel: 'panel'}  });  
        // driving.search('圆明园', '西单');

        function ssClick() {
            var start = document.getElementById("txtStart").value
                , end = document.getElementById("txtEnd").value;
            //var map = new BMap.Map("container");
            var map = new BMap.Map("allmap");
            map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
            var driving = new BMap.DrivingRoute(map, { renderOptions: { map: map, autoViewport: true } });
            driving.search(start, end);
        }
    </script>
</body>
</html>
