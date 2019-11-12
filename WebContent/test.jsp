<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>润乾报表DEMO-润乾软件</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body style="overflow: hidden">

	<%
	    String url = "reportJsp/showReport.jsp?rpx=/dashboard/dashboard.rpx";
				String search = request.getParameter("search");
				String reportName = "/dashboard/dashboard.rpx";
				if (search != null && search.length() > 0) {
					url = "/reportJsp/showReport.jsp?rpx=/search/search.rpx&scroll=yes&search="
							+ URLEncoder.encode(search, "utf-8");
					reportName = "/search/search.rpx";
				}
	%>
	<div class="container-fluid" style="height:20%;padding-left:5px;padding-right:5px;" id="tiaojian">
	</div>
	<div style="width: 100%;" id="result">
		<iframe id="bbframe" src=""
			style="padding-left: 5px; padding-right: 5px; box-shadow: 1px 0px 3px 3px #ddd; margin-top: 10px; width: 100%; height: inherit; overflow: auto;"
			frameborder="no" border="0" marginwidth="0" marginheight="0">
		</iframe>
	</div>
	<script type="text/javascript">
	var reportName="<%=reportName%>";
	</script>
	<script>
		$(document).ready(function() {
			initSize();
			//传入参数拼接
			var bbmc = "test/test.rpx"
			var params = "&province=&title=abc测试&macro1=remark";
			openReportWin(bbmc, params);
		});
		function initSize(){
			var tiaojian = $("#tiaojian").height();
			var windowHeight = $(window).height();
			var result = windowHeight - tiaojian -25;
			$("#result").css({"height":result});
		}
		function openReportWin(bbmc, params) {
			var url = "reportJsp/showReport.jsp?rpx=" + bbmc + params;
			$('#bbframe').attr('src', encodeURI(url));
		};
	</script>

</body>
</html>
