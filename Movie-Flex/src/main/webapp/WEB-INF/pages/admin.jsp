<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<html ng-app="videoApp">
<head>
<!-- <link rel="stylesheet" type="text/css" href="css/style.css"/> -->
<style>


#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 5px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}

</style>
 </head>
<script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.1/angular.min.js"></script> 
 		
 		<script>
		 
			function formSubmit() {
			document.getElementById("logoutForm").submit();
			}
				
   			var videoApp = angular.module('videoApp', []);
   			videoApp.controller('VideoCtrl',['$scope','$http',function($scope, $http) {
	   			$scope.getDataFromServer = function() {
	   			        $http({
	   			method : 'GET',
	   			url : 'jsondata' // invoking spring method
	   			                }).success(function(data, status, headers, config) {
	   			                        $scope.movieList = data;
	   			                }).error(function(data, status, headers, config) {
	   			          });
	   			    };
   			}]);
			
   		</script>
   
<body data-ng-controller="VideoCtrl" data-ng-init="getDataFromServer()">

	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
	
 	  	<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
			Welcome : ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>
	
	
Search:<input ng-model="queryResult" type="text"/>
   		<table id="customers">
      		<tr>
    		<th>Title</th>
    		<th>Year<th>
  			<th>Rated</th>
    		<th>Released</th>
    		<th>Runtime</th>
    		<th>Genre</th>
    		<th>Director</th>
    		<th>Writer</th>
    		<th>Actors</th>
    		<th>Plot</th>
    		<th>Language</th>
    		<th>Country</th>
    		<th>Awards</th>
    		<th>Poster</th>
    		<th>Metascore</th>
    		<th>imdbRating</th>
    		<th>imdbVotes</th>
    		<th>imdbID</th>
    		<th>Type</th>
      		</tr>
      		
<tr ng-repeat="movie in movieList | filter:queryResult ">
    
    		<br>
    		<td>{{movie.Title}}</td>
    		<td>{{movie.Year}}</td>
  			<td>{{movie.Rated}}</td>
    		<td>{{movie.Released}}</td>
    		<td>{{movie.Runtime}}</td>
    		<td>{{movie.Genre}}</td>
    		<td>{{movie.Director}}</td>
    		<td>{{movie.Writer}}</td>
    		<td>{{movie.Actors}}</td>
    		<td>{{movie.Plot}}</td>
    		<td>{{movie.Language}}</td>
    		<td>{{movie.Country}}</td>
    		<td>{{movie.Awards}}</td>
    		<td>{{movie.Poster}}</td>
    		<td>{{movie.Metascore}}</td>
    		<td>{{movie.imdbRating}}</td>
    		<td>{{movie.imdbVotes}}</td>
    		<td>{{movie.imdbID}}</td>
    		<td>{{movie.Type}}</td>
      		</tr>
    </table>

</body>
</html>