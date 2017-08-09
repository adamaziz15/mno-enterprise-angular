angular.module('mnoEnterpriseAngular')
  .controller 'PasswordResetCtrl', ($state, $location, Auth, toastr, MnoErrorsHandler) ->
    'ngInject'

    vm = this
    vm.resetConfirmed = false
    vm.user = {
      $pwdScore: {}
    }

    vm.password_reset = ->
      if vm.form.$invalid && !MnoErrorsHandler.onlyServerError(vm.form)
        return
      else if vm.user.password != vm.user.password_confirmation
        return

      MnoErrorsHandler.resetErrors(vm.form)

      vm.user.reset_password_token = $location.search().reset_password_token
      Auth.resetPassword(vm.user).then(
        ->
          toastr.info('devise.passwords.updated', {
            timeOut: 0,
            closeButton: true,
            extendedTimeOut: 0
          })
          Auth.login(vm.user).then(
            ->
              $state.go('home.impac')
          ).finally( -> vm.resetConfirmed = true)
          (error) ->
            MnoErrorsHandler.processServerError(error, vm.form)
        ).finally( -> vm.hasClicked = false)

      return true

    return
