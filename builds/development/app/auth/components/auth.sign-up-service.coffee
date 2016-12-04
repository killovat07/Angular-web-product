( ->

  RegisterService = ($http, $state, toastr) ->
    auth = {}
    auth.registerForm = (user) ->
      $http.post("http://smktesting.herokuapp.com/api/register/", user).then(
        (res) ->
          if res.data.success == true
            #localStorage.setItem('token', res.data.token)
            #$http.defaults.headers.common['Authorization'] = 'Token' + res.data.token
            toastr.success('Welcome to products', 'Authorization valid', {
              timeOut: 3000,
              closeButton: false
            })
            $state.go('auth.sign-in')
          else
            toastr.error(res.data.message, 'Authorization invalid', {
              timeOut: 3000,
              closeButton: false
            })
        (err) ->
          toastr.error('Try again', 'Authorization invalid', {
            timeOut: 3000,
            closeButton: false
          })
      )
    return auth

  RegisterService.$inject = ['$http', '$state', 'toastr']

  angular.module('app.auth')
    .service('RegisterService', RegisterService)

)()

