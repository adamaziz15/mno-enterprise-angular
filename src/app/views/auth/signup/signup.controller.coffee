angular.module 'mnoEnterpriseAngular'
  .controller('AuthSignUpCtrl',
    ($state, Auth, toastr, MnoErrorsHandler) ->
      vm = @

      vm.errorHandler = MnoErrorsHandler

      vm.signup = ->
        # Is form valid and if there is errors that are not server type
        if vm.form.$invalid && !MnoErrorsHandler.onlyServerError(vm.form)
          return

        # Reset last error
        MnoErrorsHandler.resetErrors(vm.form)

        Auth.register(vm.user).then(
          (response) ->
            toastr.info('Signup successful')
          (error) ->
            MnoErrorsHandler.processServerError(error, vm.form)
        )

      return
  )