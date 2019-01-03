# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$.rails.href = (element) ->
  # element.href || element.data("<%= SmartListing.config.data_attributes(:href) %>") || window.location.pathname;
  return element.attr('href') || element.data('<%= SmartListing.config.data_attributes(:href) %>') || window.location.pathname
