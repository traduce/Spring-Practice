(function () {
    var app = angular.module('customerForm', []);
    var customerDetail = {};
    app.controller('customerFormSubmitController', function ($scope, $http) {
        $scope.show = function () {
            $scope.showCustomerTable = true;
            $scope.list = [];
            var request = $http({method: 'GET', url: 'customerInfo'});
            request.success(function (data, status, header, config) {
                for (i in data) {
                    $scope.list.push(data[i]);
                }
            });
            request.error(function (data, status, header, config) {
                alert("Exception details:");
            });
        };

        $scope.edit = function (customer) {
            $scope.name = customer.name;
            $scope.ssn = customer.ssn;
            $scope.email = customer.email;
            customerDetail = customer;
        };
        $scope.update = function () {
            alert('update' + customerDetail.id);
            var formData = {'id': customerDetail.id, 'name': $scope.name, 'ssn': $scope.ssn, 'email': $scope.email};
            var request = $http.post('update', formData);

            request.success(function (data, status, header, config) {
                $scope.show();
            });
            request.error(function (data, status, header, config) {
                alert("Exception details:" + JSON.stringify({data: data}));
            });
        }

        $scope.delete = function (customer) {
            var retVal = confirm("Do you want to delete.?");
            if (retVal == true) {
                var request = $http.post('delete', customer);
                request.success(function (data, status, header, config) {
                    $scope.show();
                });
                request.error(function (data, status, header, config) {
                    alert("Exception details:" + JSON.stringify({data: data}));
                });
            } else {
                return false;
            }
        };

        $scope.list = [];
        $scope.headerText = 'Add Customer Info';
        $scope.submit = function () {
            var formData = {'name': $scope.name, 'ssn': $scope.ssn, 'email': $scope.email};
            var response = $http.post('AddCustomerData', formData);
            response.success(function (data, status, header, config) {
                $scope.list.push(data);
                clear();
                $scope.show();
            });
            response.error(function (data, status, header, config) {
                alert("Exception details:" + JSON.stringify({data: data}));
            });
        };

        function clear() {
            $scope.name = "";
            $scope.ssn = "";
            $scope.email = "";
            $scope.list = [];
        }
    });
})();