class UrlConst {

  static final String betaApiVersion = '';
  static final String productionServerUrl = 'http://192.227.120.78:5002/';
  static final String testApiVersion = 'https://api.tutorsplan.com';

  static final apiVersion = 'api/v1';

  static final String baseUrl = productionServerUrl+apiVersion;


  static final String loginEndpoint = '$baseUrl/login';
  static final String registerEndpoint = '$baseUrl/auth/register';
  static final String appRolesEndpoint = '$baseUrl/roles';
  static final String getCourseCategoryEndpoint = '$baseUrl/course-categories';
  static final String getProfileEndpoint = '$baseUrl/me';
  static final String courseEnrollmentEndpoint = '$baseUrl/stripe/course-enrollment';
  static final String getCoursesEndpoint = '$baseUrl/courses';
  static final String getCourseDetailsEndpoint = '$baseUrl/courses';
}
