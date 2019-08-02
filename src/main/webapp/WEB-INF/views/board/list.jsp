<%@ page language="java" contentType="text/html charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/common_head.jsp"/>
    <link rel="stylesheet" href="/myCss.css">
</head>

<jsp:include page="../common/header.jsp"/>
   
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <spring:message code="menu.title.view.WILT"/>
        <small>Git</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">WILT</a></li>
        <li class="active">Git</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">List</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <table id="id_git_List_view" class="table table-bordered table-hover display">
                <thead>
                    <tr>
                        <th></th>
                        <th>title</th>
                        <th>tags</th>
                        <th>regUser</th>
                        <th>regDt</th>
                    </tr>
                </thead>
              </table>
              <button type="button" id="btn_GoList" onclick="javascript: location.href='/'" class="btn btn-default">뒤로가기</button>
              <button type="button" id="btn_create" class="btn btn-danger pull-right" data-toggle="modal" data-target="#modal" data-mode="add">새 글 쓰기</button>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      <div class="modal fade" id="modal">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="fullscreen" data-target="#modal-fullscreen">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
                  <form role="form" id="modal_Create_Form">
                      <div class="box-body">
                          <div class="form-group">
                              <input type="text" name="modal_Title" id="modal_Title" class="form-control" placeholder="Untitled"/>
                          </div>
                          <div class="form-group">
                              <div class="row">  
                                  <div class="col-md-3">
                                      <label for="modal_Tags" class="fa fa-bars">&emsp;Tags</label>
                                  </div>
                                  <div class="col-md-9">
                                      <input type="text" name="modal_Tags" id="modal_Tags" placeholder="Empty" class="form-control"/>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-3">
                                      <label class="fa fa-clock-o">&emsp;Created</label>
                                  </div>
                                  <div class="col-md-9" id="modal_CreatedTime"></div>
                              </div>
                              <div class="row">
                                  <div class="col-md-3">
                                      <label class="fa fa-clock-o">&emsp;Updated</label>
                                  </div>
                                  <div class="col-md-9" id="modal_UpdatedTime"></div>
                              </div>
                              <div class="row">
                                  <div class="col-md-3">
                                      <label for="modal_Website" class="fa fa-link">&emsp;Website</label>
                                  </div>
                                  <div class="col-md-9">
                                      <input type="text" name="modal_Website" id="modal_Website" class="form-control" placeholder="Empty"/>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                      <input type="text" name="modal_Add_Property" id="modal_Add_Property" class="form-control" placeholder="Add Property"/>
                                  </div>
                              </div>
                          </div>
                        <div class="form-group">
                          <textarea type="text" class="form-control" id="modal_Content" placeholder="Content"></textarea>
                        </div>
                  </form>
                
              </div>
              
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                <button type="button" id="btn_submit" class="btn btn-primary">저장하기</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/common_footer.jsp"/>
<jsp:include page="../common/datatable.jsp"/>
<jsp:include page="../common/footerScript.jsp"/>
<script>
$(document).ready(function(){
	var id = $('#id_id').val();

	//render table as datatable
	$('#id_git_List_view').DataTable({
		ajax: {
			url:'/board/api/list_view',
			dataSrc: '',
			processing: true,
			paging: true
		},
			columns: [
				{ data: "id" },
				{
					width: "60%",
					data: "title",
					render: function(data, type, row) {
						return '<a data-toggle="modal" href="#modal" data-mode="edit" data-id="'+row.id+'">'+data+'</a>';
					}
				},
				// { width: "60%", data: "title" },
				{ width: "28%", data: "tags" },
				{ data: "regUser" },
				{ width: "12%", data: "regDt" }
			]
	});

	//modal detail view, edit view
	$('#modal').on("shown.bs.modal", function(event){
		var modalEvent = $(event.relatedTarget);
		var mode = modalEvent.data('mode');
		var id = modalEvent.data('id');
		var updDt = currentTime();
		var reqData = {
			id: id
		}
		if(mode=='edit') {
			$.ajax({
				url: '/board/api/update_view',
				method: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(reqData),
				success: function(resData) {
					$('#modal_Title').val(resData.title);
					$('#modal_Tags').val(resData.tags);
					$('#modal_Website').val(resData.website);
					$('#modal_CreatedTime').val(resData.regDt);
					$('#modal_UpdatedTime').val(resData.updDt);
					$('#modal_Content').val(resData.content);
					$('#modal_Add_Property').val(resData.property);
				},
				error: function() {
					alert('ajax error');
				}
			});
			$('#modal_UpdatedTime').val(updDt);
		}
	});

	//fucntion current time
	function currentTime(){
		var today = new Date();
		var yyyy = today.getFullYear();
		var mm = today.getMonth()+1;
		var dd = today.getDate();
		var hour = today.getHours();
		var minutes = today.getMinutes();
		if(dd<10) {
			dd = '0'+dd;
		}

		if(mm<10) {
			mm = '0'+mm;
		}
		if(minutes<10) {
			minutes = '0'+minutes;
		}
		today = yyyy+'년'+' '+mm+'월'+' '+dd+'일,'+' '+hour+':'+minutes+'분';
		return today;
	};

	//add time to newly created content
	$('#btn_create').click(function(){
		var now = currentTime();
		$('#modal_CreatedTime').html('<span>'+now+'</span>');
		$('#modal_UpdatedTime').html('<span>'+now+'</span>');
	});

	//create content and send data to server
	$('#btn_submit').click(function(event){
		var time = currentTime();
		// var modalEvent = $(event.relatedTarget);
		// var mode = modalEvent.data('mode');
		// console.log(mode);
		var reqData = {
			title: $('#modal_Title').val(),
			tags: $('#modal_Tags').val(),
			regDt: time,
			content: $('#modal_Content').val(),
			website: $('#modal_Website').val(),
			property: $('#modal_Add_Property').val()
		}
    
    $('#modal').remove();

		$.ajax({
			url: "/board/api/create",
			method: "POST",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(reqData),
			success: function() {
				window.close();
				location.href="/board/list_view";
			},
			error: function() {
				alert('ajax error');
			}
		});
  	});
});
</script>