angular.module 'mnoEnterpriseAngular'
  .controller('AuthLoginCtrl',
    ($rootScope, Auth, toastr, $state) ->
      vm = @

      $rootScope.isLoggedIn = true

      vm.login = ->
        Auth.login(vm.user).then(
          ->
            toastr.success('You have successfully logged in!')
            $state.go('home.impac')
          (error) ->
            toastr.error(error.data.error)
        ).finally(-> vm.hasClicked = false)

      return
  )