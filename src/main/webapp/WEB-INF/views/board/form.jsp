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
                                <textarea type="text" class="form-control" id="modal_Content"></textarea>
                            </div>
                        </form>
                    
                    </div>
                    <div class="modal-body">
                    <p>One fine body&hellip;</p>
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                    <button type="button" id="btn_submit" class="btn btn-primary">Save changes</button>
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