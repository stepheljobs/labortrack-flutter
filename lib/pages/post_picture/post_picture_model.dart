import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'post_picture_widget.dart' show PostPictureWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PostPictureModel extends FlutterFlowModel<PostPictureWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TimeStatusRadioButton widget.
  FormFieldController<String>? timeStatusRadioButtonValueController;
  // State field(s) for ProjectDropDown widget.
  String? projectDropDownValue;
  FormFieldController<String>? projectDropDownValueController;
  // State field(s) for currentLocation widget.
  FocusNode? currentLocationFocusNode;
  TextEditingController? currentLocationController;
  String? Function(BuildContext, String?)? currentLocationControllerValidator;
  // State field(s) for currentDate widget.
  FocusNode? currentDateFocusNode;
  TextEditingController? currentDateController;
  String? Function(BuildContext, String?)? currentDateControllerValidator;
  // State field(s) for noteTextfield widget.
  FocusNode? noteTextfieldFocusNode;
  TextEditingController? noteTextfieldController;
  String? Function(BuildContext, String?)? noteTextfieldControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostRecord? uploadPost;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    currentLocationFocusNode?.dispose();
    currentLocationController?.dispose();

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
