<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.laptrinhjavaweb.util.SecurityUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
		<ul class="sidebar navbar-nav">
				<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Quản lí người dùng</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<%-- 	<a class="dropdown-item" href="<c:url value='/danh-sach'/>">Danh sách quản lý</a> 
					<a class="dropdown-item" href="<c:url value='danh-sach'/>">Danh sách nhân viên</a>  --%>
					<a class="dropdown-item" href="<c:url value='danh-sach'/>">Danh sách khách hàng</a> 
						
				</div>
				</li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="<c:url value='/danh-sach-hoa-don'/>" id="pagesDropdown"> 
				<i class="fas fa-fw fa-folder"></i>Quản lí hóa đơn</a>
				</li>
				
				<%-- <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="<c:url value='/danh-sach-the-loai'/>" id="pagesDropdown"> 
				<i class="fas fa-fw fa-folder"></i>Quản lí Thể Loại</a>
				</li> --%>
				
				
			<li class="nav-item"><a class="nav-link" href="<c:url value='/danh-sach-hoc-vien/${userId}'/>">
					<i class="fas fa-fw fa-chart-area"></i> <span>Điểm danh</span>
			</a></li>
			
		</ul> 