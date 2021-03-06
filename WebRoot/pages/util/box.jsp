<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@page import="com.fuwei.entity.Customer"%>
<%@page import="com.fuwei.commons.SystemCache"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>ASOS箱贴生成器 -- 桐庐富伟针织厂</title>
		<meta charset="utf-8">
		<meta http-equiv="keywords" content="针织厂,针织,富伟,桐庐">
		<meta http-equiv="description" content="富伟桐庐针织厂">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- 为了让IE浏览器运行最新的渲染模式 -->
		<link href="css/plugins/bootstrap.min.css" rel="stylesheet"
			type="text/css" />
		<link href="css/plugins/font-awesome.min.css" rel="stylesheet"
			type="text/css" />
		<link href="css/common/common.css" rel="stylesheet" type="text/css" />
		<script src="js/plugins/jquery-1.10.2.min.js"></script>
		<script src="js/plugins/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/common/common.js" type="text/javascript"></script>

		<script src="js/util/box.js" type="text/javascript"></script>
		<style type="text/css">
		.body{
			width: 30cm;
		}
		.gridTab{
	height: 29.7cm;
	width: 21cm;
	margin: auto;
	font-size:20px;
}
#formwidget{
	
}
#tablewidget{
	
}
#printWidget{
	overflow:auto;
}
		</style>
	</head>
	<body>
		<%@ include file="../common/head.jsp"%>
		<div id="Content">
			<div id="main">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="user/index">首页</a>
						</li>
						<li class="active">
							ASOS箱贴生成器
						</li>
					</ul>
				</div>
				<div class="body">
					<div id="customer">
						<div class="container-fluid">
							<div class="row">
								<div id="formwidget" class="col-sm-12">
									<div class="panel panel-primary">
										<div class="panel-heading">
											<h3 class="panel-title">
												设置装箱资料
											</h3>
										</div>
										<div class="panel-body">
											<form class="form-horizontal" role="form" method="post">
												<input type="hidden" name="id" id="id" />
												<div class="form-group">
													<label for="ASOS_ORDER_NUMBER"
														class="col-sm-3 control-label">
														ASOS ORDER NUMBER
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control require"
															name="ASOS_ORDER_NUMBER" id="ASOS_ORDER_NUMBER"
															placeholder="ASOS ORDER NUMBER">
													</div>
													<div class="col-sm-1"></div>
												</div>

												<div class="form-group">
													<label for="ASOS_MDA_NUMBER" class="col-sm-3 control-label">
														ASOS MDA NUMBER
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control require"
															name="ASOS_MDA_NUMBER" id="ASOS_MDA_NUMBER"
															placeholder="ASOS MDA NUMBER">
													</div>
													<div class="col-sm-1"></div>
												</div>
												<div class="form-group">
													<label for="ASOS_Style_Number"
														class="col-sm-3 control-label">
														ASOS Style Number
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control require"
															name="ASOS_Style_Number" id="ASOS_Style_Number"
															placeholder="ASOS Style Number">
													</div>
													<div class="col-sm-1"></div>
												</div>
												<div class="form-group">
													<label for="UNITS_PER_CARTON"
														class="col-sm-3 control-label">
														UNITS PER CARTON
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control require"
															name="UNITS_PER_CARTON" id="UNITS_PER_CARTON"
															placeholder="UNITS PER CARTON">
													</div>
													<div class="col-sm-1"></div>
												</div>
												<div class="form-group">
													<label for="ASOS_SKU_Number" class="col-sm-3 control-label">
														ASOS SKU Number
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control require"
															name="ASOS_SKU_Number" id="ASOS_SKU_Number"
															placeholder="ASOS SKU Number">
													</div>
													<div class="col-sm-1"></div>
												</div>
												<div class="form-group">
													<label for="total_number" class="col-sm-3 control-label">
														总箱数
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control require"
															name="total_number" id="total_number" placeholder="总箱数">
													</div>
													<div class="col-sm-1"></div>
												</div>

												<div class="form-group">
													<div class="col-sm-offset-3 col-sm-5">
														<button id="engSubBtn" type="button" class="btn btn-primary"
															data-loading-text="正在保存...">
															生成英国地址的箱贴
														</button>
													</div>
													<div class="col-sm-3">
														<button type="reset" class="btn btn-default">
															重置表单
														</button>
													</div>
													<div class="col-sm-1"></div>
												</div>

												<div class="form-group">
													<div class="col-sm-offset-3 col-sm-5">
														<button id="germanSubBtn" type="button" class="btn btn-primary"
															data-loading-text="正在保存...">
															生成德国地址的箱贴
														</button>
													</div>
													<div class="col-sm-1"></div>
												</div>
											</form>
										</div>
									</div>
								</div>

							
							</div>
						</div>

					</div>
				</div>
			</div>
			<script type="text/javascript">
				/* 设置当前选中的页 */
				var $a = $("#left li a[href='util/box']");
				setActiveLeft($a.parent("li"));
				/* 设置当前选中的页 */
				$("#engSubBtn").click(function(){
					$("form").attr("action","util/box");
					$("form").submit();
				});
				$("#germanSubBtn").click(function(){
					$("form").attr("action","util/box_german");
					$("form").submit();
				});
			</script>
	</body>
</html>