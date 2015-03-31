var myApp = angular.module('AgileApp', []);
myApp.controller('AgileController', function ($http, $scope) {

    $scope.GetstudentInfo = function () {
        $http({
            method: 'Get',
            url: '/Home/GetstudentInfo'
        })
        .success(function (result) {         
            $("#subjectid").removeClass("hidden");
            $scope.stInfo = result;          
            console.log(result);          
        }).error(function (err) {
            console.log(err);
        });
    }

    $scope.GetsubjectInfo = function (stdid) {            
       
        $http({
            method: 'Get',
            url: '/Home/GetsubjectInfo',
            params: { Studentid: stdid }
        })
        .success(function (result) {
         
            $scope.stsubjectinfo = result;
            console.log(result);           
        }).error(function (err) {
            console.log(err);
        });
    }
    $scope.AddActiveclass = function (subjectId, studentId) {
       
        $("#hidnsubjectid").val(subjectId);
        $("#hidnstudentid").val(studentId);
        $('.abchigh').removeClass('highlight');
        $('#' + subjectId).addClass('highlight');
        $("#Add").removeClass("hidden");

    }

    $scope.Addsubject = function () {
        var subjectId = $("#hidnsubjectid").val();
        var studentId = $("#hidnstudentid").val();        
        $http({
            method: 'Post',
            url: '/Home/AddSubjectInfo',
            data: { subjectId: subjectId, studentId: studentId }
        })
        .success(function (result) {           
            $scope.stinfo = result;
            console.log(result);
            alert('Record Inserted success');
            $("#detail").removeClass("hidden");
          
        }).error(function (err) {
            console.log(err);
        });
    }
    $scope.RemoverecordClass = function (Id) {    

        $("#hiddid").val(Id);       
        $('.abchight').removeClass('highlight');
        $('#' + Id).addClass('highlight');
        $("#Remove").removeClass("hidden");

    }
    $scope.RemoveRecord = function () {
        var Subid = $("#hiddid").val();      
        $http({
            method: 'Post',
            url: '/Home/RemoveRecord',
            data: { Id: Subid, }
        })
        .success(function (result) {       
           console.log(result);
            alert('Record deleted success');           
            $('.abchight').removeClass('highlight');
            $('#' + Id).addClass('stgrid');
            Addsubject();        
        }).error(function (err) {
            console.log(err);
        });
    }
});