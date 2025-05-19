class UrlConst {
  static final String betaApiVersion = '';
  static final String productionApiVersion = '';
  static final String testApiVersion = 'https://api.tutorsplan.com';

  static final String serverUrl = testApiVersion;

  static final String loginEndpoint = '$testApiVersion/login';
  static final String registerEndpoint = '$testApiVersion/app-users';
  static final String appRolesEndpoint = '$testApiVersion/app-roles';
  static final String getCoursesEndpoint = '$testApiVersion/course-categories';
  static final String getProfileEndpoint = '$testApiVersion/me';
  static final String courseEnrollmentEndpoint = '$testApiVersion/stripe/course-enrollment';
  static final String coursesEndpoint = '$testApiVersion/courses';
}
