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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'post_picture_model.dart';
export 'post_picture_model.dart';

class PostPictureWidget extends StatefulWidget {
  const PostPictureWidget({super.key});

  @override
  State<PostPictureWidget> createState() => _PostPictureWidgetState();
}

class _PostPictureWidgetState extends State<PostPictureWidget> {
  late PostPictureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostPictureModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      _model.locationAPI = await GetLocationAPICall.call(
        lat: functions.getLatitude(currentUserLocationValue),
        long: functions.getLongitude(currentUserLocationValue),
      );
      if ((_model.locationAPI?.succeeded ?? true)) {
        final selectedMedia = await selectMedia(
          imageQuality: 50,
          includeBlurHash: true,
          multiImage: false,
        );
        if (selectedMedia != null &&
            selectedMedia
                .every((m) => validateFileFormat(m.storagePath, context))) {
          setState(() => _model.isDataUploading1 = true);
          var selectedUploadedFiles = <FFUploadedFile>[];

          try {
            showUploadMessage(
              context,
              'Uploading file...',
              showLoading: true,
            );
            selectedUploadedFiles = selectedMedia
                .map((m) => FFUploadedFile(
                      name: m.storagePath.split('/').last,
                      bytes: m.bytes,
                      height: m.dimensions?.height,
                      width: m.dimensions?.width,
                      blurHash: m.blurHash,
                    ))
                .toList();
          } finally {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _model.isDataUploading1 = false;
          }
          if (selectedUploadedFiles.length == selectedMedia.length) {
            setState(() {
              _model.uploadedLocalFile1 = selectedUploadedFiles.first;
            });
            showUploadMessage(context, 'Success!');
          } else {
            setState(() {});
            showUploadMessage(context, 'Failed to upload data');
            return;
          }
        }

        if (FFAppState().setDay !=
            dateTimeFormat('EEEE', getCurrentTimestamp)) {
          setState(() {
            FFAppState().TimeInAllAttendance = [];
            FFAppState().TimeOutAllAttendance = [];
            FFAppState().setDay = functions.getDayToday()!;
          });
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Failed getting location.'),
              content: Text(
                  'Device location not found. Please open your gps location and try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

    _model.currentDateController ??= TextEditingController(
        text: dateTimeFormat('yMMMd', getCurrentTimestamp));
    _model.currentDateFocusNode ??= FocusNode();

    _model.noteTextfieldController ??= TextEditingController();
    _model.noteTextfieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ProjectsRow>>(
      future: ProjectsTable().queryRows(
        queryFn: (q) => q.eq(
          'company_code',
          getJsonField(
            FFAppState().apiUserData,
            r'''$[:].company_code''',
          ).toString(),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ProjectsRow> postPictureProjectsRowList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                automaticallyImplyLeading: false,
                title: Text(
                  'Form Attendance',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Urbanist',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 24.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: Image.memory(
                                    _model.uploadedLocalFile1.bytes ??
                                        Uint8List.fromList([]),
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: 'imageTag',
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: 'imageTag',
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.memory(
                                _model.uploadedLocalFile1.bytes ??
                                    Uint8List.fromList([]),
                                width: double.infinity,
                                height: 215.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Text(
                              'Complete the attendance form and submit',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: FlutterFlowRadioButton(
                                options: ['Time In', 'Time Out'].toList(),
                                onChanged: (val) => setState(() {}),
                                controller: _model
                                        .timeStatusRadioButtonValueController ??=
                                    FormFieldController<String>('Time In'),
                                optionHeight: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                selectedTextStyle:
                                    FlutterFlowTheme.of(context).bodyLarge,
                                textPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 24.0, 0.0),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.horizontal,
                                radioButtonColor:
                                    FlutterFlowTheme.of(context).info,
                                inactiveRadioButtonColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.center,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: FlutterFlowDropDown<String>(
                              controller:
                                  _model.projectDropDownValueController ??=
                                      FormFieldController<String>(
                                _model.projectDropDownValue ??= '',
                              ),
                              options: postPictureProjectsRowList
                                  .map((e) => e.projectName)
                                  .toList(),
                              onChanged: (val) => setState(
                                  () => _model.projectDropDownValue = val),
                              width: double.infinity,
                              height: 50.0,
                              searchHintTextStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              searchTextStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Please select project',
                              searchHintText: 'Search for an item...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              fillColor: Colors.white,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              hidesUnderline: true,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _model.currentDateController,
                                        focusNode: _model.currentDateFocusNode,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.calendar_month_outlined,
                                            color: Color(0xFF262D34),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .currentDateControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 12.0, 20.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Posted By:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 4.0),
                                      child: Text(
                                        getJsonField(
                                          FFAppState().apiUserData,
                                          r'''$[:].display_name''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (FFAppState().isShow == false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                          ),
                                          child: CheckboxListTile(
                                            value: _model.noteCheckboxValue ??=
                                                false,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.noteCheckboxValue =
                                                      newValue!);
                                            },
                                            title: Text(
                                              'Do you need notes?',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        ),
                                        if (_model.noteCheckboxValue == true)
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .noteTextfieldController,
                                                focusNode: _model
                                                    .noteTextfieldFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Write your note.',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                maxLines: null,
                                                validator: _model
                                                    .noteTextfieldControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FutureBuilder<List<EmployeesRow>>(
                                    future: EmployeesTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'assign_project',
                                            _model.projectDropDownValue,
                                          )
                                          .eq(
                                            'company_code',
                                            getJsonField(
                                              FFAppState().apiUserData,
                                              r'''$[:].company_code''',
                                            ).toString(),
                                          )
                                          .order('first_name'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<EmployeesRow>
                                          listViewEmployeesRowList =
                                          snapshot.data!;
                                      if (listViewEmployeesRowList.isEmpty) {
                                        return EmptyEmployeeWidget();
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewEmployeesRowList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewEmployeesRow =
                                              listViewEmployeesRowList[
                                                  listViewIndex];
                                          return Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                // list of all employee has already time in
                                                if (_model
                                                        .timeStatusRadioButtonValue ==
                                                    'Time In')
                                                  Expanded(
                                                    child: Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                      child: CheckboxListTile(
                                                        value: _model
                                                                .checkboxTimeInValueMap[
                                                            listViewEmployeesRow] ??= false,
                                                        onChanged: ((FFAppState()
                                                                        .TimeInAllAttendance
                                                                        .contains(
                                                                            '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}') ==
                                                                    true) &&
                                                                (_model.timeStatusRadioButtonValue ==
                                                                    'Time In'))
                                                            ? null
                                                            : (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxTimeInValueMap[
                                                                            listViewEmployeesRow] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  if (_model
                                                                          .timeStatusRadioButtonValue ==
                                                                      'Time In') {
                                                                    // first name and last name of  employee
                                                                    // checkedTimeInEmployee
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .addToCheckTimeInAttendance(
                                                                              '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}');
                                                                    });
                                                                  } else {
                                                                    // first name and last name of  employee
                                                                    // checkedTimeOutEmployee
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .addToCheckTimeOutAttendance(
                                                                              '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}');
                                                                    });
                                                                  }
                                                                } else {
                                                                  if (_model
                                                                          .timeStatusRadioButtonValue ==
                                                                      'Time In') {
                                                                    // RemoveCheckedEmployeeTImeIn
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .removeFromCheckTimeInAttendance(
                                                                              '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}');
                                                                    });
                                                                  } else {
                                                                    // RemoveCheckEmployeee TImeOut
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .removeFromCheckTimeOutAttendance(
                                                                              '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}');
                                                                    });
                                                                  }
                                                                }
                                                              },
                                                        title: Text(
                                                          '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        checkColor: ((FFAppState()
                                                                        .TimeInAllAttendance
                                                                        .contains(
                                                                            '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}') ==
                                                                    true) &&
                                                                (_model.timeStatusRadioButtonValue ==
                                                                    'Time In'))
                                                            ? null
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        dense: true,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                      ),
                                                    ),
                                                  ),

                                                // list of all employee has already time out
                                                if (_model
                                                        .timeStatusRadioButtonValue ==
                                                    'Time Out')
                                                  Expanded(
                                                    child: Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                      child: CheckboxListTile(
                                                        value: _model
                                                                .checkboTimeOutValueMap[
                                                            listViewEmployeesRow] ??= false,
                                                        onChanged: (((FFAppState()
                                                                            .TimeOutAllAttendance
                                                                            .contains(
                                                                                '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}') ==
                                                                        true) &&
                                                                    (_model.timeStatusRadioButtonValue ==
                                                                        'Time Out')) &&
                                                                (_model.timeStatusRadioButtonValue ==
                                                                    'Time Out'))
                                                            ? null
                                                            : (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboTimeOutValueMap[
                                                                            listViewEmployeesRow] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  if (_model
                                                                          .timeStatusRadioButtonValue ==
                                                                      'Time In') {
                                                                    // checkedTimeInEmployee
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .addToCheckTimeInAttendance(
                                                                              '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}');
                                                                    });
                                                                  } else {
                                                                    // checkedTimeOutEmployee
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .addToCheckTimeOutAttendance(
                                                                              '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}');
                                                                    });
                                                                  }
                                                                } else {
                                                                  if (_model
                                                                          .timeStatusRadioButtonValue ==
                                                                      'Time In') {
                                                                    // RemoveCheckedEmployeeTImeIn
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .removeFromCheckTimeInAttendance(
                                                                              '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}');
                                                                    });
                                                                  } else {
                                                                    // RemoveCheckEmployeee TImeOut
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .removeFromCheckTimeOutAttendance(
                                                                              '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}');
                                                                    });
                                                                  }
                                                                }
                                                              },
                                                        title: Text(
                                                          '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        checkColor: (((FFAppState()
                                                                            .TimeOutAllAttendance
                                                                            .contains(
                                                                                '${listViewEmployeesRow.firstName} ${listViewEmployeesRow.lastName}') ==
                                                                        true) &&
                                                                    (_model.timeStatusRadioButtonValue ==
                                                                        'Time Out')) &&
                                                                (_model.timeStatusRadioButtonValue ==
                                                                    'Time Out'))
                                                            ? null
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        dense: true,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: (_model.projectDropDownValue == '')
                                      ? null
                                      : () async {
                                          context.pushNamed('main');
                                        },
                                  text: 'Cancel',
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x00195C92),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 18.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    disabledColor: Color(0xFFA7A8AA),
                                    disabledTextColor: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: (_model.projectDropDownValue == '')
                                      ? null
                                      : () async {
                                          // uploadImage
                                          {
                                            setState(() =>
                                                _model.isDataUploading2 = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedFiles =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .uploadedLocalFile1
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [_model.uploadedLocalFile1]
                                                  : <FFUploadedFile>[];
                                              selectedFiles =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                                storageFolderPath:
                                                    '${getJsonField(
                                                  FFAppState().apiUserData,
                                                  r'''$[:].company_code''',
                                                ).toString()}/${_model.projectDropDownValue}',
                                              );
                                              downloadUrls =
                                                  await uploadSupabaseStorageFiles(
                                                bucketName: 'attendance',
                                                selectedFiles: selectedFiles,
                                              );
                                            } finally {
                                              _model.isDataUploading2 = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedFiles.length &&
                                                downloadUrls.length ==
                                                    selectedFiles.length) {
                                              setState(() {
                                                _model.uploadedLocalFile2 =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl2 =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              setState(() {});
                                              return;
                                            }
                                          }

                                          if (_model
                                                  .timeStatusRadioButtonValue ==
                                              'Time In') {
                                            unawaited(
                                              () async {
                                                _model.timeInAttendance =
                                                    await PostAttendanceTable()
                                                        .insert({
                                                  'company_code': getJsonField(
                                                    FFAppState().apiUserData,
                                                    r'''$[:].company_code''',
                                                  ).toString(),
                                                  'photo_url':
                                                      _model.uploadedFileUrl2,
                                                  'project_name': _model
                                                      .projectDropDownValue,
                                                  'location': GetLocationAPICall
                                                      .currentAddress(
                                                    (_model.locationAPI
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.first,
                                                  'posted_by': getJsonField(
                                                    FFAppState().apiUserData,
                                                    r'''$[:].display_name''',
                                                  ).toString(),
                                                  'status': _model
                                                      .timeStatusRadioButtonValue,
                                                  'date': _model
                                                      .currentDateController
                                                      .text,
                                                  'laborers': FFAppState()
                                                      .checkTimeInAttendance,
                                                });
                                              }(),
                                            );
                                            // check if the new employee selected is in the list and already has  attendance
                                            _model.employeeyTimeIn = await actions
                                                .getEmployeeAlreadyAttendance(
                                              FFAppState()
                                                  .checkTimeInAttendance
                                                  .toList(),
                                              FFAppState()
                                                  .TimeInAllAttendance
                                                  .toList(),
                                            );
                                            // save the new state
                                            setState(() {
                                              FFAppState().TimeInAllAttendance =
                                                  _model.employeeyTimeIn!
                                                      .toList()
                                                      .cast<String>();
                                            });
                                            setState(() {
                                              FFAppState()
                                                  .checkTimeInAttendance = [];
                                            });
                                          } else {
                                            unawaited(
                                              () async {
                                                _model.timeOutAttendance =
                                                    await PostAttendanceTable()
                                                        .insert({
                                                  'company_code': getJsonField(
                                                    FFAppState().apiUserData,
                                                    r'''$[:].company_code''',
                                                  ).toString(),
                                                  'photo_url':
                                                      _model.uploadedFileUrl2,
                                                  'project_name': _model
                                                      .projectDropDownValue,
                                                  'location': GetLocationAPICall
                                                      .currentAddress(
                                                    (_model.locationAPI
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.first,
                                                  'posted_by': getJsonField(
                                                    FFAppState().apiUserData,
                                                    r'''$[:].display_name''',
                                                  ).toString(),
                                                  'status': _model
                                                      .timeStatusRadioButtonValue,
                                                  'laborers': FFAppState()
                                                      .checkTimeOutAttendance,
                                                  'date': _model
                                                      .currentDateController
                                                      .text,
                                                });
                                              }(),
                                            );
                                            // check if the new employee selected is in the list and already has  attendance
                                            _model.employeeyTimeOut =
                                                await actions
                                                    .getEmployeeAlreadyAttendance(
                                              FFAppState()
                                                  .checkTimeOutAttendance
                                                  .toList(),
                                              FFAppState()
                                                  .TimeOutAllAttendance
                                                  .toList(),
                                            );
                                            // save the new state
                                            setState(() {
                                              FFAppState()
                                                      .TimeOutAllAttendance =
                                                  _model.employeeyTimeOut!
                                                      .toList()
                                                      .cast<String>();
                                            });
                                            setState(() {
                                              FFAppState()
                                                  .checkTimeOutAttendance = [];
                                            });
                                          }

                                          setState(() {
                                            _model.isDataUploading1 = false;
                                            _model.uploadedLocalFile1 =
                                                FFUploadedFile(
                                                    bytes:
                                                        Uint8List.fromList([]));
                                          });

                                          context.pushNamed('main');

                                          setState(() {});
                                        },
                                  text: 'Submit',
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    disabledColor: Color(0xFFA7A8AA),
                                    disabledTextColor: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
