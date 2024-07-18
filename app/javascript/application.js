import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

import { ProgressBar } from 'stimulus-form-progress-bar'
application.register('progress-bar', ProgressBar)
