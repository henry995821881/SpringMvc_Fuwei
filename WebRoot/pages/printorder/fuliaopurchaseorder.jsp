<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@page import="com.fuwei.entity.OrderDetail"%>
<%@page import="com.fuwei.entity.Order"%>
<%@page import="com.fuwei.entity.ordergrid.FuliaoPurchaseOrder"%>
<%@page import="com.fuwei.entity.ordergrid.FuliaoPurchaseOrderDetail"%>
<%@page import="com.fuwei.commons.SystemCache"%>
<%@page import="com.fuwei.util.SerializeTool"%>
<%@page import="com.fuwei.util.DateTool"%>
<%
	Order order = (Order) request.getAttribute("order");
	//辅料采购单
	FuliaoPurchaseOrder fuliaoPurchaseOrder = (FuliaoPurchaseOrder) request
			.getAttribute("fuliaoPurchaseOrder");
	List<FuliaoPurchaseOrderDetail> fuliaoPurchaseOrderDetailList = fuliaoPurchaseOrder == null ? new ArrayList<FuliaoPurchaseOrderDetail>()
			: fuliaoPurchaseOrder.getDetaillist();
%>
<!DOCTYPE html>
<html>
	<head>

		<title>辅料采购单 -- 桐庐富伟针织厂</title>
		<meta charset="utf-8">
		<meta http-equiv="keywords" content="针织厂,针织,富伟,桐庐">
		<meta http-equiv="description" content="富伟桐庐针织厂">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- 为了让IE浏览器运行最新的渲染模式 -->
	</head>
	<body class="">
		<div class="container-fluid gridTab auto_container">
			<div class="row">
				<div class="col-md-12 tablewidget">
					<table class="table noborder">
						<caption id="tablename">
							桐庐富伟针织厂辅料采购单
						</caption>
					</table>

					<table id="orderTb" class="tableTb noborder">
						<tbody>
							<tr>
								<td width="15%">
									供货方：
								</td>
								<td class="orderproperty">
									<span><%=fuliaoPurchaseOrder == null ? ""
					: (fuliaoPurchaseOrder.getCompany() == null ? ""
							: fuliaoPurchaseOrder.getCompany())%></span>
								</td>
								<td width="15%"></td>

								<td width="15%">

								</td>
								<td>
								</td>

							</tr>
							<tr height="20px">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="5">
									<table>
										<tr>
											<td>
												公司
											</td>
											<td><%=SystemCache.getCompanyName(order.getCompanyId())%></td>
										</tr>
										<tr>
											<td>
												客户
											</td>
											<td><%=order.getKehu()%></td>
										</tr>
										<tr>
											<td>
												货号
											</td>
											<td><%=order.getProductNumber()%></td>
										</tr>
										<tr>
											<td>
												款名
											</td>
											<td><%=order.getName()%></td>
										</tr>
										<tr>
											<td>
												跟单
											</td>
											<td><%=SystemCache.getUserName(order.getCharge_user())%></td>
										</tr>
									</table>
								</td>
							</tr>
						</tbody>
					</table>

					<table id="mainTb" class="noborder">
						<tr>
							<td>
								<table class="detailTb">
									<caption>
										采购列表
									</caption>
									<thead>
										<tr>
											<th width="15%">
												辅料类型
											</th>
											<th width="15%">
												标准样
											</th>
											<th width="15%">
												数量
											</th>
											<th width="15%">
												价格
											</th>
											<th width="15%">
												交期
											</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (FuliaoPurchaseOrderDetail detail : fuliaoPurchaseOrderDetailList) {
										%>
										<tr class="tr">
											<td class="style"><%=detail.getStyle()%>
											</td>
											<td class="standardsample"><%=detail.getStandardsample()%>
											</td>
											<td class="quantity"><%=detail.getQuantity()%>
											</td>
											<td class="price"><%=detail.getPrice()%>
											</td>
											<td class="end_at"><%=detail.getEnd_at()%>
											</td>
										</tr>

										<%
											}
										%>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan='4'>
								<p>
									质量要求：毛球必须按照原样大小及品质生产，必须塞弹力絮。毛球中不得含有利器。毛球口须抽紧。如有以上问题造成客户索赔，贵单位须承担全部损失。
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<table class="auto_height stickedTb">

									<caption>
										提货记录
									</caption>
									<thead>
										<tr>
											<th width="25%">
												辅料类型
											</th>
											<th width="25%">
												数量
											</th>
											<th width="25%">
												日期
											</th>
											<th width="25%">
												提货人
											</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>

									</tbody>

								</table>
							</td>
						</tr>
					</table>

					<p id="tip" class="auto_bottom">
						备注：请妥善保管此订购单。结账以此表格生产信息及提货记录为准。如有遗失我厂概不负责！！！
					</p>
					<p class="pull-right auto_bottom">
						<span id="created_user">制单人：</span>
						<span id="date"> 日期：</span>
					</p>



				</div>

			</div>
		</div>
	</body>
</html>