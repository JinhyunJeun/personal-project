<%@ page language="java" contentType="text/html charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
        .reveal * {
            display: none;
        }

        .reveal *.handle {
            display: block;
        }
        </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Dashboard</title>
    <link rel="stylesheet" href="/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/bower_components/jvectormap/jquery-jvectormap.css">
</head>
    <script>
        window.onload = function() {
            var elements = document.getElementsByClassName("reveal");
            for(var i = 0; i<elements.length; i++) {
                var elt = elements[i];
                var title = elt.getElementsByClassName("handle")[0];
                title.onclick = function() {
                    if(elt.className=="reveal") elt.className = "revealed";
                    else if(elt.className == "revealed") elt.classNme = "reveal";
                }
            }
        }
    </script>
    <body>
        <div class="reveal">
        <h1 class="handle">Click here to see the hidden text</h1>
            <p>한글입력</p>
        </div>
    </body>
</html>