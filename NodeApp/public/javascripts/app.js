var app = angular.module('angularjsNodejsTutorial',[]);
app.controller('myController', function($scope, $http) {
        $scope.message="";
        $scope.Submit = function() {
        //console.log('entered with'+ $scope.email);
        var request = $http.get('/data/'+$scope.email);
        request.success(function(data) {
            console.log('got response');
            $scope.data = data;
        });
        request.error(function(data){
            console.log('err');
        });
    
    }; 
});

// To implement "Insert a new record", you need to:
// - Create a new controller here
// - Create a corresponding route handler in routes/index.js
app.controller('insertController', function($scope,$http){
    $scope.message = "";
    $scope.Insert = function(){
        var request = $http.get('/login/'+$scope.login+'/name/'+$scope.name+'/sex/'+$scope.sex+'/RelationshipStatus/'+ $scope.RelationshipStatus + '/Birthyear/'+$scope.Birthyear);
        request.success(function(data) {
            console.log('got response');
            console.log(data + 'got row inserted');
        });
        request.error(function(data){
            console.log('err');
        });

    };    
});

app.controller('friendsController', function($scope,$http){
    $scope.message = "";
    $scope.Show = function(){
        var request = $http.get('/personlogin/'+$scope.login);
        request.success(function(data){
            console.log('got response');
            $scope.data = data;
            console.log(data);
        });
        request.error(function(data){
            console.log('err');
        });

    };

});

function onlyUnique(value, index, self) { 
    return self.indexOf(value) === index;
}

// // usage example:
// var a = ['a', 1, 'a', 2, '1'];
// var unique = a.filter( onlyUnique );

app.controller('showfamilyController', function ($scope,$http){
    var familyList = [];
    console.log('aaa');
    // $scope.Parents = "Parent Company";
    // $scope.Children = "Child Company";
    var request = $http.get('/getFamily');
            request.success(function(data){
            console.log('got response');
            var parentList = [];
            //console.log(data);
            for (x =0;x<data.length;x++)
            {
                familyList.push(data[x]);
                parentList.push(data[x].ParentCompany)
            }
            $scope.familymembers = familyList;
            parentUniqueList = parentList.filter(onlyUnique);
            $scope.parentUniqueList = parentUniqueList;

        });
        request.error(function(data){
            console.log('err');
        });

    $scope.Change = function(parentItem){

        childrenList = [];
        console.log("entered");
        //$scope.childrenList = familyList.get(parentItem.x);
        //console.log(parentItem);
        for(x=0;x<familyList.length;x++)
        {
        //console.log(familyList[x].ParentCompany);
        if(familyList[x].ParentCompany === parentItem)
        {
        //console.log(familyList[x].ChildCompany);
        childrenList.push(familyList[x].ChildCompany);
        }
        }    

        $scope.childrenList = childrenList;
        // console.log(familyList.get(parentItem.x));
        // console.log($scope.childrenList);
        //console.log($scope.childrenList);
    };

    $scope.ShowFamily = function(parentCompany,childCompany){
        console.log(parentCompany);
        console.log(childCompany);
        var request = $http.get('/query2/parent/'+parentCompany+'/child/'+childCompany);
        request.success(function(data){
            console.log('got response');
            $scope.data = data;
        });
        request.error(function(data){
            console.log('err');
        });

    };

});
