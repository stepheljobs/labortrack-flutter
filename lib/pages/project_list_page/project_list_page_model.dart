import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_project_list/empty_project_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'project_list_page_widget.dart' show ProjectListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectListPageModel extends FlutterFlowModel<ProjectListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in projectListPage widget.
  List<ProjectsRecord>? queryProject;
  // Stores action output result for [Custom Action - convertDocToJson] action in projectListPage widget.
  List<dynamic>? projectResponse;
  // State field(s) for ProjectnameTextField widget.
  FocusNode? projectnameTextFieldFocusNode;
  TextEditingController? projectnameTextFieldController;
  String? Function(BuildContext, String?)?
      projectnameTextFieldControllerValidator;
  // State field(s) for ProjectlocationTextField widget.
  FocusNode? projectlocationTextFieldFocusNode;
  TextEditingController? projectlocationTextFieldController;
  String? Function(BuildContext, String?)?
      projectlocationTextFieldControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProjectsRecord>? queryProjectAddButton;
  // Stores action output result for [Custom Action - convertDocToJson] action in Button widget.
  List<dynamic>? projectResponseAddButton;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    projectnameTextFieldFocusNode?.dispose();
    projectnameTextFieldController?.dispose();

    projectlocationTextFieldFocusNode?.dispose();
    projectlocationTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
