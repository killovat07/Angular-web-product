( ->

  ProductsService = ($resource) ->
    $resource('http://smktesting.herokuapp.com/api/products')



  ProductsService.$inject = ['$resource']

  angular.module('app.products')
    .service('ProductsService', ProductsService)

)()
