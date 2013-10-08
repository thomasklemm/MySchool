# app
$ ->
  $('.alert').click ->
    $(this).fadeOut()

  localCalendarOptions = {
    buttonText: {
      today: 'Heute',
      month: 'Monat',
      day: 'Tag',
      week: 'Woche'
    },
    monthNames: ['Januar','Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember'],
    monthNamesShort: ['Jan','Feb','Mär','Apr','Mai','Jun','Jul','Aug','Sept','Okt','Nov','Dez'],
    dayNames: ['Sonntag','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag'],
    dayNamesShort: ['So','Mo','Di','Mi','Do','Fr','Sa']
  }

  testsCalendarOptions = $.extend(localCalendarOptions, {
      weekends: false,
      events: $('#tests-calendar').data('tests'),
      backgroundColor: '#900'
    })

  $('#tests-calendar').fullCalendar(testsCalendarOptions)


