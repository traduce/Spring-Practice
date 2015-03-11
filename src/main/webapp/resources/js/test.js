//var taskManagerModule = angular.module('taskManagerApp', ['ngAnimate']);
var taskManagerModule = angular.module('taskManagerApp', ['ngAnimate']);
taskManagerModule.controller('taskMangerController',function($scope,$http){
    var urlBase="";
    $scope.toggle=true;
    $scope.selection=[];
    $scope.statuses=['ACTIVE','COMPLETED'];
    $scope.priorities=['HIGH','MEDIUM','LOW'];
    $http.defaults.headers.post["Content-Type"]="application/json";
    alert('test');
    
    function findAllTasks(){
        
    }
});