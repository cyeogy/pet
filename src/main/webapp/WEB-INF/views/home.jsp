<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<body>
    <div class="preloader">
        <div class="loader">
            <div class="spinner">
                <div class="spinner-container">
                    <div class="spinner-rotator">
                        <div class="spinner-left">
                            <div class="spinner-circle"></div>
                        </div>
                        <div class="spinner-right">
                            <div class="spinner-circle"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<div>
		<tiles:insertAttribute name="top" />
	</div>
	
	<div>
		<tiles:insertAttribute name="contdent" />
 	</div>
 	
 	<div>
 		<tiles:insertAttribute name="footer" />	
 	</div>
</body>
</html>