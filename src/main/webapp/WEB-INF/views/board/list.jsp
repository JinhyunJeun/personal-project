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
                        <th>id</th>
                        <th>title</th>
                        <th>regUser</th>
                        <th>regDt</th>
                        <th>tags</th>
                    </tr>
                </thead>
                <tfoot>
                    <td>
                        <button type="button" id="btn_GoList" class="btn btn-danger">뒤로가기</button>
                    </td>
                    <td>
                        <button type="button" id="btn_create" class="btn btn-danger">새 글 쓰기</button>
                    </td>
                </tfoot>
              </table>
              
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/common_footer.jsp"/>
<jsp:include page="../common/datatable.jsp"/>
<jsp:include page="../common/footerScript.jsp"/>
<script>
// $(document).ready(function(){
  $('#id_git_List_view').DataTable({
      ajax: {
          url:'/board/api/list_view',
          dataSrc: '',
          pageLength: 10,
          processing: true,
      },
          columns: [
              {data: "id"},
              {data: "title"},
              {data: "regUser"},
              {data: "regDt"},
              {data: "tags"}
          ]
  });
// });
</script>