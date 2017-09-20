angular.module 'mnoEnterpriseAngular'
  .controller('AuthConfirmCtrl',
    ($state, $stateParams, MnoeAuthSvc, toastr, MnoErrorsHandler) ->
      vm = @
      vm.user = {phone_country_code: "US", confirmation_token: $stateParams.confirmation_token}

      MnoeAuthSvc.one("/users/confirmation").get({confirmation_token: vm.user.confirmation_token}).then(
        ->
          debugger
        (error) ->
          debugger
      )

      vm.confirmUser = ->

      return
  )
