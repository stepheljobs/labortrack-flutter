import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'project_list_widget.dart' show ProjectListWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectListModel extends FlutterFlowModel<ProjectListWidget> {
  ///  State fields for stateful widgets in this page.

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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    projectnameTextFieldFocusNode?.dispose();
    projectnameTextFieldController?.dispose();

    projectlocationTextFieldFocusNode?.dispose();
    projectlocationTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
