<%@ page language="java" contentType="text/html charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/common_head.jsp"/>
</head>

<jsp:include page="../common/header.jsp"/>
   
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        WILT(What I Learned Today)
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
              <button type="button" id="btn_create" class="btn btn-danger pull-right" data-toggle="modal" data-target="#modal_Create" data-mode="add">새 글 쓰기</button>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      <div class="modal fade" id="modal_Create">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
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
                                      <label for="modal_Url" class="fa fa-link">&emsp;Url</label>
                                  </div>
                                  <div class="col-md-9">
                                      <input type="text" name="modal_Url" id="modal_Url" class="form-control" placeholder="Empty"/>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                      <input type="text" name="modal_Add_Property" id="modal_Add_Property" class="form-control" placeholder="Add a Property"/>
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
                render: function(data, type, row, meta) {
                     return '<a data-toggle="modal" href="#modal_Create">'+data+'</a>';
                 }
              },
              // { width: "60%", data: "title" },
              { width: "28%", data: "tags" },
              { data: "regUser" },
              { width: "12%", data: "regDt" }
          ]
  });
  
  function currentTime(){
      var today = new Date();
      var yyyy = today.getFullYear();
      var mm = today.getMonth();
      var dd = today.getDate()+1;
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
  
  $('#btn_create').click(function(){
    //   console.log(currentTime());
      var now = currentTime();
      $('#modal_CreatedTime').html('<span>'+now+'</span>');
      $('#modal_UpdatedTime').html('<span>'+now+'</span>');
  });
  
  $('#btn_submit').click(function(){
    var time = currentTime();
    var reqData = {
      title: $('#modal_Title').val(),
      tags: $('#modal_Tags').val(),
      regDt: time,
      content: $('#modal_Content').val(),
      url: $('#modal_Url').val(),
      property: $('#modal_Add_Property').val()
    }
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