import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_employee/empty_employee_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'post_picture_widget.dart' show PostPictureWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PostPictureModel extends FlutterFlowModel<PostPictureWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getLocationAPI)] action in postPicture widget.
  ApiCallResponse? locationAPI;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TimeStatusRadioButton widget.
  FormFieldController<String>? timeStatusRadioButtonValueController;
  // State field(s) for ProjectDropDown widget.
  String? projectDropDownValue;
  FormFieldController<String>? projectDropDownValueController;
  // State field(s) for currentDate widget.
  FocusNode? currentDateFocusNode;
  TextEditingController? currentDateController;
  String? Function(BuildContext, String?)? currentDateControllerValidator;
  // State field(s) for noteCheckbox widget.
  bool? noteCheckboxValue;
  // State field(s) for noteTextfield widget.
  FocusNode? noteTextfieldFocusNode;
  TextEditingController? noteTextfieldController;
  String? Function(BuildContext, String?)? noteTextfieldControllerValidator;
  // State field(s) for CheckboxTimeIn widget.

  Map<EmployeesRow, bool> checkboxTimeInValueMap = {};
  List<EmployeesRow> get checkboxTimeInCheckedItems =>
      checkboxTimeInValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboTimeOut widget.

  Map<EmployeesRow, bool> checkboTimeOutValueMap = {};
  List<EmployeesRow> get checkboTimeOutCheckedItems =>
      checkboTimeOutValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PostAttendanceRow? timeInAttendance;
  // Stores action output result for [Custom Action - getEmployeeAlreadyAttendance] action in Button widget.
  List<String>? employeeyTimeIn;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PostAttendanceRow? timeOutAttendance;
  // Stores action output result for [Custom Action - getEmployeeAlreadyAttendance] action in Button widget.
  List<String>? employeeyTimeOut;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    currentDateFocusNode?.dispose();
    currentDateController?.dispose();

    noteTextfieldFocusNode?.dispose();
    noteTextfieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get timeStatusRadioButtonValue =>
      timeStatusRadioButtonValueController?.value;
}
