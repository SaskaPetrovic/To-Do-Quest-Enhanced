# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@popperjs/core", to: "popper.js", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.2.0/dist/chart.js"
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.2
