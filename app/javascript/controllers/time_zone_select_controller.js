import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.value = this.detectTimeZone()
  }

  // from https://github.com/shanebo/tzone/blob/master/lib/tzone.js
  summerTZOffset () {
    var d = new Date()
    var summer = new Date(Date.UTC(d.getFullYear(), 6, 30))
    return -1 * summer.getTimezoneOffset()
  }

  winterTZOffset () {
    var d = new Date()
    var winter = new Date(Date.UTC(d.getFullYear(), 12, 30))
    return -1 * winter.getTimezoneOffset()
  }

  detectTimeZone () {
    var so = this.summerTZOffset()
    var wo = this.winterTZOffset()

    if (so === -660 && wo === -660) { return "Pacific/Midway" }
    if (so === -600 && wo === -600) { return "Pacific/Tahiti" }
    if (so === -570 && wo === -570) { return "Pacific/Marquesas" }
    if (so === -540 && wo === -600) { return "America/Adak" }
    if (so === -540 && wo === -540) { return "Pacific/Gambier" }
    if (so === -480 && wo === -540) { return "US/Alaska" }
    if (so === -480 && wo === -480) { return "Pacific/Pitcairn" }
    if (so === -420 && wo === -480) { return "US/Pacific" }
    if (so === -420 && wo === -420) { return "US/Arizona" }
    if (so === -360 && wo === -420) { return "US/Mountain" }
    if (so === -360 && wo === -360) { return "America/Guatemala" }
    if (so === -360 && wo === -300) { return "Pacific/Easter" }
    if (so === -300 && wo === -360) { return "US/Central" }
    if (so === -300 && wo === -300) { return "America/Bogota" }
    if (so === -240 && wo === -300) { return "US/Eastern" }
    if (so === -240 && wo === -240) { return "America/Caracas" }
    if (so === -240 && wo === -180) { return "America/Santiago" }
    if (so === -180 && wo === -240) { return "Canada/Atlantic" }
    if (so === -180 && wo === -180) { return "America/Montevideo" }
    if (so === -180 && wo === -120) { return "America/Sao_Paulo" }
    if (so === -150 && wo === -210) { return "America/St_Johns" }
    if (so === -120 && wo === -180) { return "America/Godthab" }
    if (so === -120 && wo === -120) { return "America/Noronha" }
    if (so === -60 && wo === -60) { return "Atlantic/Cape_Verde" }
    if (so === 0 && wo === -60) { return "Atlantic/Azores" }
    if (so === 0 && wo === 0) { return "Africa/Casablanca" }
    if (so === 60 && wo === 0) { return "Europe/London" }
    if (so === 60 && wo === 60) { return "Africa/Algiers" }
    if (so === 60 && wo === 120) { return "Africa/Windhoek" }
    if (so === 120 && wo === 60) { return "Europe/Amsterdam" }
    if (so === 120 && wo === 120) { return "Africa/Harare" }
    if (so === 180 && wo === 120) { return "Europe/Athens" }
    if (so === 180 && wo === 180) { return "Africa/Nairobi" }
    if (so === 240 && wo === 180) { return "Europe/Moscow" }
    if (so === 240 && wo === 240) { return "Asia/Dubai" }
    if (so === 270 && wo === 210) { return "Asia/Tehran" }
    if (so === 270 && wo === 270) { return "Asia/Kabul" }
    if (so === 300 && wo === 240) { return "Asia/Baku" }
    if (so === 300 && wo === 300) { return "Asia/Karachi" }
    if (so === 330 && wo === 330) { return "Asia/Calcutta" }
    if (so === 345 && wo === 345) { return "Asia/Katmandu" }
    if (so === 360 && wo === 300) { return "Asia/Yekaterinburg" }
    if (so === 360 && wo === 360) { return "Asia/Colombo" }
    if (so === 390 && wo === 390) { return "Asia/Rangoon" }
    if (so === 420 && wo === 360) { return "Asia/Almaty" }
    if (so === 420 && wo === 420) { return "Asia/Bangkok" }
    if (so === 480 && wo === 420) { return "Asia/Krasnoyarsk" }
    if (so === 480 && wo === 480) { return "Australia/Perth" }
    if (so === 540 && wo === 480) { return "Asia/Irkutsk" }
    if (so === 540 && wo === 540) { return "Asia/Tokyo" }
    if (so === 570 && wo === 570) { return "Australia/Darwin" }
    if (so === 570 && wo === 630) { return "Australia/Adelaide" }
    if (so === 600 && wo === 540) { return "Asia/Yakutsk" }
    if (so === 600 && wo === 600) { return "Australia/Brisbane" }
    if (so === 600 && wo === 660) { return "Australia/Sydney" }
    if (so === 630 && wo === 660) { return "Australia/Lord_Howe" }
    if (so === 660 && wo === 600) { return "Asia/Vladivostok" }
    if (so === 660 && wo === 660) { return "Pacific/Guadalcanal" }
    if (so === 690 && wo === 690) { return "Pacific/Norfolk" }
    if (so === 720 && wo === 660) { return "Asia/Magadan" }
    if (so === 720 && wo === 720) { return "Pacific/Fiji" }
    if (so === 720 && wo === 780) { return "Pacific/Auckland" }
    if (so === 765 && wo === 825) { return "Pacific/Chatham" }
    if (so === 780 && wo === 780) { return "Pacific/Enderbury" }
    if (so === 840 && wo === 840) { return "Pacific/Kiritimati" }
  }
}
