
( ->

  AuthController = ($scope, $state, SigninService, RegisterService) ->

    $scope.checkStorage = () ->
      if localStorage['token']
        $scope.status = true
      else
        $scope.status = false


    if localStorage['token']
      $scope.status = true
    else
      $scope.status = false

    $scope.logout = () ->
      $scope.status = false
      localStorage.clear()

    $scope.loginForm = () ->
      SigninService.loginForm($scope.user)


    $scope.registerForm = () ->
      RegisterService.registerForm($scope.user)



  AuthController.$inject = ['$scope', '$state', 'SigninService', 'RegisterService']

  angular.module('app.auth')
    .controller('AuthController', AuthController)

)()

