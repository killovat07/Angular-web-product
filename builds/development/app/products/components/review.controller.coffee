
( ->

  ReviewController = ($scope, $stateParams, ReviewService, SendReviewService) ->

    $scope.detail = $stateParams.obj

    $scope.review = ReviewService.query({id: $stateParams.id}).$promise.then(
      (response) ->
        $scope.reviews = response
    )

    $scope.Comment = () ->
      SendReviewService.Comment($scope.user)

    $scope.rate = 0

    #**Load MORE**
    #$scope.limit = 4

    #$scope.loadMore = ->
      #increamented = $scope.limit + 4
      #$scope.limit = if increamented > $scope.reviews.length then $scope.reviews.length else increamented




  ReviewController.$inject = ['$scope', '$stateParams',  'ReviewService', 'SendReviewService']

  angular.module('app.products')
    .controller('ReviewController', ReviewController)

)()

