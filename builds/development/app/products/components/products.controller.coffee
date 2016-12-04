
( ->

  ProductsController = ($scope, ProductsService) ->

    ProductsService.query().$promise.then(
       (response) ->
         $scope.products = response
     )




  ProductsController.$inject = ['$scope', 'ProductsService']

  angular.module('app.products')
    .controller('ProductsController', ProductsController)

)()

