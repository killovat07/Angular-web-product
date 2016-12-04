do ->

  routeConfig = ($httpProvider, $stateProvider, $urlRouterProvider) ->
    #$httpProvider.defaults.useXDomain = true
    #delete $httpProvider.defaults.headers.common['X-Requested-With']
    $stateProvider
      .state('auth',
        abstract: true
        templateUrl: '/app/templates/auth/auth.html')

      .state('auth.sign-in',
        url: '/sign-in',
        controller: 'AuthController'
        templateUrl: '/app/templates/auth/sign-in/sign-in.html')

      .state('auth.sign-up',
        url: '/sign-up',
        controller: 'AuthController'
        templateUrl: '/app/templates/auth/sign-up/sign-up.html')


  routeConfig.$inject = [
    '$httpProvider',
    '$stateProvider',
    '$urlRouterProvider'
  ]

  angular.module('app.auth', [])
    .config(routeConfig)

