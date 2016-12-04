
( ->

  routeConfig = ($httpProvider, $stateProvider, $urlRouterProvider) ->

    #$httpProvider.defaults.useXDomain = true
    #delete $httpProvider.defaults.headers.common['X-Requested-With']

    $stateProvider
      .state('products',
        url: '/products'
        params: {
          obj: null
        }
        controller: 'ProductsController'
        templateUrl: '/app/templates/products/products-template.html')

      .state('products.detail',
        url: '/:id'
        params: {
          obj: null
        }
        views:
          '@':
            controller: 'ReviewController'
            templateUrl: '/app/templates/products/products-detail-template.html')








  routeConfig.$inject = ['$httpProvider', '$stateProvider', '$urlRouterProvider'
  ]

  angular.module('app.products', [ 'ui.router', 'ngAnimate'])
    .config(routeConfig)
)()
