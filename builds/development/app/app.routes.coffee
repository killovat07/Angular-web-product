( ->
  routeConfig = ($httpProvider, $stateProvider, $urlRouterProvider, $locationProvider) ->

    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']

    # $locationProvider.html5Mode(true);


    $urlRouterProvider.otherwise('/products')

  routeConfig.$inject = ['$httpProvider', '$stateProvider', '$urlRouterProvider', '$locationProvider']

  angular
    .module('app.routes', [])
    .config(routeConfig)

)()