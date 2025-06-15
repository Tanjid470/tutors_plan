class UrlConst {

  static final String betaApiVersion = '';
  static final String productionServerUrl = 'http://192.227.120.78:5002/';
  static final String testApiVersion = 'https://api.tutorsplan.com';

  static final apiVersion = 'api/v1';

  static final String baseUrl = productionServerUrl+apiVersion;


  static final String loginEndpoint = '$baseUrl/auth/login';
  static final String registerEndpoint = '$baseUrl/auth/register';
  static final String otpEndpoint = '$baseUrl/auth/verify-email';
  static final String resendOtpEndpoint = '$baseUrl/auth/resend-otp';
  static final String appRolesEndpoint = '$baseUrl/roles';
  static final String getCourseCategoryEndpoint = '$baseUrl/course-categories';
  static final String getProfileEndpoint = '$baseUrl/user-profile';
  static final String courseEnrollmentEndpoint = '$baseUrl/stripe/checkout-session';
  static final String getCoursesEndpoint = '$baseUrl/courses/published';
  static final String getMyCoursesEndpoint = '$baseUrl/students-course-enrollments/my-courses';
  static final String getExamsEndpoint = '$baseUrl/exams';
  static final String getCourseDetailsEndpoint = '$baseUrl/courses';
  static final String getCourseModulesEndpoint = '$baseUrl/course-modules';
  static final String sEndpoint = '$baseUrl/stripe/success';
  static final String eEndpoint = '$baseUrl/stripe/cancel';
}
