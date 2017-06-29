angular.module 'mnoEnterpriseAngular'
  .controller('ProvisioningConfirmCtrl', () ->

    vm = this

    vm.selectedPricingPlan = {
      name: "Standard Plan",
      currency: "AUD",
      factor: "/Full Moon/Camels",
      description: "As standard as your opinions",
      price: {
        value: 300
      }
    }

    return
  )
