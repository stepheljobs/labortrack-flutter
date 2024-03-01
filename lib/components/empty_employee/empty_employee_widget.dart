import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_employee_model.dart';
export 'empty_employee_model.dart';

class EmptyEmployeeWidget extends StatefulWidget {
  const EmptyEmployeeWidget({super.key});

  @override
  State<EmptyEmployeeWidget> createState() => _EmptyEmployeeWidgetState();
}

class _EmptyEmployeeWidgetState extends State<EmptyEmployeeWidget> {
  late EmptyEmployeeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyEmployeeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Seems you don’t have any employee in this project.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
