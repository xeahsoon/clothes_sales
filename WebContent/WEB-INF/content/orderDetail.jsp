<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="id" value="${order.id }"></c:set>
<c:set var="remark" value="${order.remark }"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单明细</title>
    <script>
        $.getScript("js/orderDetail.js");
    </script>
</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">销售清单查询</h2>
    </div>
    <div class="row">
        <div class="col-md-3">
	        <div class="input-group pull-left">
	            <input type="text" id="search_id" name="search_id" class="primary-input form-control" autofocus placeholder="请输入流水单号..">
	        	<input type="hidden" id="search_url" value="checkOrderID"/>
	        	<input type="hidden" id="search_name" value="orderDetail"/>
	            <span class="input-group-addon searcher" onclick="search()">查询</span>
	        </div>
        </div>
    </div>
    
    <div class="table-responsive" style="margin-top: 30px">
        <h3 class="page-header"><font title="默认显示最近一笔订单明细">清单明细</font></h3>
        <table class="table table-striped table-condensed" id="info">
            <style>
               #info td:nth-child(3n) {
                    color: #dddddd;
                }
            </style>
            <tr style="border-bottom:1px solid #ddd;">
                <td>单号：</td><td><fmt:formatNumber value="${requestScope.order.id }" pattern="00000000"/></td><td>/</td>
                <td>时间：</td><td><fmt:formatDate value="${order.create_date }" type="both"/></td><td>/</td>
                <td>收银：</td><td>${order.user.name }</td><td>/</td>
                <td>导购：</td><td>
                	<c:forEach items="${order.staffs }" var="staff">
						${staff.staff.name }
					</c:forEach>
                </td><td>/</td>
                <td>支付方式：</td><td>
                	<c:if test="${order.pay_mode == 1 }">银行卡</c:if>
					<c:if test="${order.pay_mode == 2 }">支付宝</c:if>
					<c:if test="${order.pay_mode == 3 }">微信</c:if>
					<c:if test="${order.pay_mode == 4 }">现金</c:if>
                </td>
                <td>/</td><td>会员：</td>
                <td>
                	<c:if test="${empty order.member.phone }">无会员信息</c:if>
                	${order.member.phone }
                </td>
            </tr>
        </table>
    </div>
    
   	<div class="panel panel-default">
	<div class="panel-body" style="background-color: #fafafa;">
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th width="15%">条形码</th>
                <th width="11%">款号</th>
                <th width="11%">类型</th>
                <th width="11%">颜色</th>
                <th width="11%">大小</th>
                <th width="11%">原价</th>
                <th width="11%">折扣</th>
                <th width="11%">金额</th>
                <th width="8%">
                    <span id="check_ok" class="glyphicon glyphicon-ok operator"></span>
                    <span id="check_remove" class="glyphicon glyphicon-remove operator" style="display: none"></span>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${order.details }" var="detail">
            	<c:if test="${detail.return_flag == 0 }">
            	<tr>
            		<td><fmt:formatNumber value="${detail.storage_id }" pattern="00000000000"/></td>
            		<td><fmt:formatNumber value="${detail.good.id }" pattern="00000000"/></td>
            		<td>${detail.good.type }</td>
            		<td>${detail.color }</td>
            		<td>${detail.size }</td>
            		<td>${detail.price }</td>
            		<td><fmt:formatNumber value="${detail.discount }" pattern="0.00" /></td>
            		<td>${detail.dis_price }</td>	
            		<td><input type="checkbox" name="order_item" value="<fmt:formatNumber value='${detail.storage_id }' pattern='00000000000'/>"></td>
            	</tr>
            	</c:if>
            	<c:if test="${detail.return_flag == 1 }">
            	<tr  style="color: #888;">
            		<td><fmt:formatNumber value="${detail.storage_id }" pattern="00000000000"/></td>
            		<td><fmt:formatNumber value="${detail.good.id }" pattern="00000000"/></td>
            		<td>${detail.good.type }</td>
            		<td>${detail.color }</td>
            		<td>${detail.size }</td>
            		<td>${detail.price }</td>
            		<td><fmt:formatNumber value="${detail.discount }" pattern="0.00" /></td>
            		<td>${detail.dis_price }</td>	
            		<td><span class="glyphicon glyphicon-tag" title="已退货&nbsp;<fmt:formatDate value='${order.return_date }' type='both'/>"></span></td>
            	</tr>
            	</c:if>
            </c:forEach>
            <tr style="border-bottom: 2px solid #ddd">
                <td colspan="4">
                    <label>备注：&nbsp;&nbsp;</label>
                    <span id="table_remark">${order.remark }</span>
                    <!-- 
                    <marquee behavior="scroll" direction="left" style="width: 88%; height:16px;">
                        ${order.remark }
                    </marquee>
                    -->
                </td>
                <td>
                	<input type="hidden" value="<fmt:formatNumber value="${order.id }" pattern="00000000"/>" id="hidden_id">
                	<input type="hidden" value="${order.remark }" id="hidden_remark">
                	<span class="glyphicon glyphicon-edit operator" title="备注" data-toggle="modal" data-target="#remarkModal" onclick="setModalContent()"></span>
                	<span style="color: #ddd;">/</span>
                    <span class="glyphicon glyphicon-print operator" title="打印" data-toggle="modal" data-target="#printModal"></span>
                </td>
                <td>合计</td>
                <td>${order.nums }件</td>
                <td>${order.sum_money }</td>
                <td>
                    <span class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-list operator"></span>
                        <!--<b class="caret"></b>-->
                    </span>
                    <ul class="dropdown-menu dropdown-menu-right" style="margin-top: -10px;">
                        <li><a onclick="returnGoods('${requestScope.order.id }','${requestScope.order.return_flag }')">退货</a></li>
                        <li><a onclick="toastr.info('正在建设中..')">换货</a></li>
                    </ul>
                </td>
            </tr>
            </tbody>
        </table>
        <!-- add remark modal -->
		<div class="modal fade" id="remarkModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form method="post">
						<!-- 提交方式必须为post，否则中文会乱码，原因不清 -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">添加备注</h4>
						</div>
						<div class="modal-body">
							<p>
								<span>备注信息：</span> <span class="pull-right"> 单号： <input
									id="order_id" name="order_id" type="text"
									style="height: 20px; width: 62px; background-color: transparent; border: none;" />
								</span>
							</p>
							<textarea id="remark_content" name="remark_content" class="form-control"
								rows="3" style="width: 100%; resize: none"></textarea>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default"
								id="dismissButton" data-dismiss="modal" value="关闭">
							<input type="button" class="btn btn-primary"
							 	id="saveButton"	onclick="sendRemark()" value="保存">
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- printing modal -->
        <c:import url="printModal.jsp"></c:import>
    </div>
    </div>
    </div>
</div>
</body>
</html>