$(document).ready( function() {
	/* 设置当前选中的页 */
	var $a = $("#left li a[href='fuliao_purchase_order/add']");
	setActiveLeft($a.parent("li"));
	/* 设置当前选中的页 */

	// 重置按钮
		$("button.reset").click( function() {
			$form = $(this).closest("form");
			$form[0].reset();
			$("#previewWidget img").attr("src", "");
		});
		// 重置按钮
		
	
		$("#sampleImgA").click( function() {
			$("#chooseSampleBtn").click();
			return false;
		});
		$("#chooseSampleBtn").click( function() {
			// 出现样品选择弹出框
				var src = $("#sampleIframe").attr("src");
				if (!src || src == "") {
					$("#sampleIframe").attr("src", "sample/search");
				}
				$("#sampleDialog").modal();

				// 设置样品弹出框表格选中之后的操作
				window.searchback = function(sampleId) {
					// 将数据填充到页面上
					$.ajax( {
						url :"sample/get/" + sampleId,
						type :'GET',
						success : function(sample) {
							sample.sampleId = sample.id;
							Common.fillForm($(".saveform")[0], sample);
							$("#sampleImgA").attr("href", "/" + sample.img);
							$("#sampleImg").attr("src", "/" + sample.img_s);
							$("#sampleDialog").modal('hide');
						},
						error : function(result) {
							Common.Error("获取订单详情信息失败：" + result.responseText);
							$("#sampleDialog").modal('hide');
						}
					});
				};
			});
		
		
		var fuliaoPurchaseGrid = new OrderGrid({
			tipText:"辅料采购单",
			url:"fuliao_purchase_order/add",
			postUrl:"fuliao_purchase_order/put",
			$content:$(".fuliaoorderWidget"),
			tbOptions:{
				colnames : [
							{
								name :'style',
								colname :'辅料类型',
								width :'15%'
							},
							{
								name :'standardsample',
								colname :'标准样',
								width :'15%'
							},
							{
								name :'quantity',
								colname :'数量',
								width :'15%'
							},
							{
								name :'price',
								colname :'价格(/个)',
								width :'15%'
							},
							{
								name :'end_at',
								colname :'交期',
								width :'15%'
							},
							{
								name :'_handle',
								colname :'操作',
								width :'15%',
								displayValue : function(value, rowdata) {
									return "<a class='editRow' href='#'>修改</a> | <a class='deleteRow' href='#'>删除</a>";
								}
							} ],
							$dialog:$("#fuliaopurchaseDialog")
				}
			
		});
		
	});