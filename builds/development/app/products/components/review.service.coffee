( ->

  ReviewService = ($resource) ->
    $resource 'http://smktesting.herokuapp.com/api/reviews/:id', {}, query:
      method: 'GET'
      params: {id: 'review'}
      isArray: true

  SendReviewService = ($resource, $stateParams, $state, toastr) ->
    comment = {}
    comment.Comment = (user) ->
      $resource('http://smktesting.herokuapp.com/api/reviews/:id', {id: $stateParams.id}, save:
        method: 'POST'
        headers: {'Authorization': 'Token ' +localStorage['token']}
      ).save(user).$promise.then(
        (res) ->
          $state.reload()
        (err) ->
          toastr.error('At first LOGIN and try again', 'Authorization invalid', {
            timeOut: 4000
            closeButton: false
          })
      )
    return comment


  ReviewService.$inject = ['$resource']
  SendReviewService.$inject = ['$resource', '$stateParams', '$state', 'toastr']

  angular.module('app.products')
    .service('ReviewService', ReviewService)
    .service('SendReviewService', SendReviewService)

)()

