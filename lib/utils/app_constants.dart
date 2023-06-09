class AppConstants{

  ///App version
  static const String appVersion = "Version 1.0.0";

  /// Api Resource
  static const String CREATE_ACCOUNT = "https://task.teamrabbil.com/api/v1/registration";
  static const String LOGIN_ACCOUNT = "https://task.teamrabbil.com/api/v1/login";
  static const String NEW_TASK_URI = "https://task.teamrabbil.com/api/v1/listTaskByStatus/New";
  static const String COMPLETD_TASK_URI = "https://task.teamrabbil.com/api/v1/listTaskByStatus/Completed";
  static const String CANCEL_TASK_URI = "https://task.teamrabbil.com/api/v1/listTaskByStatus/Cancel";
  static const String PROGRESS_TASK_URI = "https://task.teamrabbil.com/api/v1/listTaskByStatus/Progress";
  static const String CREATE_TASK = "https://task.teamrabbil.com/api/v1/createTask";
  static const Map<String,String> REQUEST_HEADER = {'Content-Type': 'application/json', 'Accept': 'application/json'};


  /// String
  static const String NEW_TASK = "New Task";
  static const String COMPLETED = "Completed";
  static const String PROGRESS = "Progress";
  static const String CANCELED = "Canceled";
  static const String JOIN_WITH_US = "Join With Us";
  static const String GET_STARTED_WITH = "Get Started With";
  static const String EMAIL = "Email";
  static const String FIRST_NAME = "First Name";
  static const String LAST_NAME = "Last Name";
  static const String MOBILE = "Mobile";
  static const String PASSWORD = "Password";
  static const String CONFIRM_PASSWORD = "Confirm Password";
  static const String ADD_NEW_TASK = "Add New Task";
  static const String SUBJECT = "Subject";
  static const String DESCRIPTION = "Description";

  /// Dummy Text
  static const String LOREM_TEXT = "Lorem Ipsum is simply dummy text";
  static const String DUMMY_TEXT = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
      "when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

}