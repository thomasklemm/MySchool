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
      eventSources: [
        {
          events: $('#tests-calendar').data('tests'),
          color: 'blue'
        },
        {
          # feiertage in bayern
          url: 'https://www.google.com/calendar/feeds/lofluq81gi3mjogddkldetu4i4%40group.calendar.google.com/public/basic',
          color: 'red',
          cache: true
        },
        {
          # ferientage in bayern
          url: 'https://www.google.com/calendar/feeds/f9jqir1be9lku30c13sfasf8u4%40group.calendar.google.com/public/basic',
          color: 'green',
          cache: true
        }
      ]
    })

  $('#tests-calendar').fullCalendar(testsCalendarOptions)


