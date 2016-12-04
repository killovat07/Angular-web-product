( ->

  SigninService = ($http, $state, toastr) ->
    service = {}
    userStatus = false

    service.loginForm = (user) ->
      $http.post("http://smktesting.herokuapp.com/api/login/", user).then(
        (res) ->
          if res.data.success == true
            localStorage.setItem('token', res.data.token)
            #$http.defaults.headers.common['Authorization'] = 'Token ' + res.data.token
            toastr.success('Welcome to products', 'Authorization valid', {
              timeOut: 3000,
              closeButton: false
            })

            $state.go 'products'
            userStatus = res.data.success
          else
            userStatus = false
            toastr.error(res.data.message, 'Autorization invalid', {
              timeOut: 3000,
              closeButton: false
            })
        (err) ->
          userStatus = false
          toastr.error('Try again', 'Autorization invalid', {
            closeButton: false
          })
      )
      return userStatus

    service.getStatus = () ->
      userStatus
      return

    return service

  SigninService.$inject = ['$http', '$state', 'toastr']

  angular.module('app.auth')
    .service('SigninService', SigninService)

)()