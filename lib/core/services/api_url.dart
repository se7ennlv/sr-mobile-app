class ApiUrl {
  //auth_service
  static const String VERIFY_USERNAME = '/esr/username';
  static const String LOGIN = '/esr/login';
  static const String OTP_GEN = '/esr/otp-gen';
  static const String OTP_MAIL = '/esr/otp-mail';

  //user_service
  static const String GET_PROFILE = '/esr/account';
  static const String PUT_CONTACT = '/esr/put-contact';
  static const String PUT_PASSWORD = '/esr/put-password';
  static const String CHECKPOINT = '/esr/checkpoint';

  //utils_service
  static const String GET_ABOUTSR = '/esr/about';
  static const String GET_OPTIONS = '/esr/option/';
  static const String GET_MONTHS = '/esr/month';
  static const String GET_YEARS = '/esr/year';
  static const String GET_PROMOTIONS = '/mktg/promotion';
  static const String GET_PROPOPUP = '/mktg/pro-popup';

  //benefit_service
  static const String GET_FEEDS = '/ehr/articles';
  static const String GET_MAINDOCS = '/ehr/doc/main';
  static const String GET_SUBDOCS = '/ehr/doc/sub';
  static const String GET_SRP = '/ehr/srp';
  static const String GET_MYMART = '/ehr/mymart';
  static const String GET_LEAVE = '/ehr/leave';
  static const String GET_ROSTER = '/ehr/roster';
  static const String GET_CLINIC = '/ehr/mycln/';
  static const String GET_PAYSLIP = '/ehr/payslip';
  static const String SENDMAIL = '/ehr/sendmail';
  static const String GET_MYSURVEY = '/ehr/mysurvey';
  static const String PUT_SURVEY = '/ehr/surv/put';
}
