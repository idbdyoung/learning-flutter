import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scheduler_practice/components/custom_textfield.dart';
import 'package:scheduler_practice/const/colors.dart';
import 'package:scheduler_practice/database/drift_database.dart';
import 'package:scheduler_practice/models/category_color.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final int? scheduleId;

  const ScheduleBottomSheet({
    required this.selectedDate,
    this.scheduleId,
    super.key,
  });

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;
  int? selectedColorId;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return FutureBuilder(
        future: widget.scheduleId == null
            ? null
            : GetIt.I<LocalDatabase>().getScheduleById(widget.scheduleId!),
        builder: (context, snapshot) {
          // 오류가 있을때
          if (snapshot.hasError) {
            return Center(
              child: Text('스케줄을 불러올 수 없습니다.'),
            );
          }

          //로딩중일때
          if (snapshot.connectionState != ConnectionState.none &&
              !snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData && startTime == null) {
            startTime = snapshot.data!.startTime;
            endTime = snapshot.data!.endTime;
            content = snapshot.data!.content;
            selectedColorId = snapshot.data!.colorId;
          }

          return SafeArea(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 2 + bottomInset,
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomInset),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Time(
                          onStartSaved: (String? val) {
                            startTime = int.parse(val!);
                          },
                          onEndSaved: (String? val) {
                            endTime = int.parse(val!);
                          },
                          startInitialValue: startTime?.toString() ?? '',
                          endInitialValue: endTime?.toString() ?? '',
                        ),
                        const SizedBox(height: 16.0),
                        _Content(
                          onContentSaved: (String? val) {
                            content = val;
                          },
                          initialValue: content ?? '',
                        ),
                        const SizedBox(height: 16.0),
                        FutureBuilder(
                          future: GetIt.I<LocalDatabase>().getCategoryColors(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.data!.isNotEmpty &&
                                selectedColorId == null) {
                              selectedColorId = snapshot.data![0].id;
                            }

                            return _ColorPicker(
                                colors: snapshot.hasData ? snapshot.data! : [],
                                selectedColorId: selectedColorId,
                                setSelectedColorId: (int id) {
                                  setState(() {
                                    selectedColorId = id;
                                  });
                                });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        _SaveButton(onPressed: onPressSaveButton),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void onPressSaveButton() async {
    if (formKey.currentState == null) {
      return;
    }

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (widget.scheduleId == null) {
        await GetIt.I<LocalDatabase>().createSchedule(
          ScheduleCompanion(
            date: Value(widget.selectedDate),
            content: Value(content!),
            startTime: Value(startTime!),
            endTime: Value(endTime!),
            colorId: Value(selectedColorId!),
          ),
        );
      } else {
        await GetIt.I<LocalDatabase>().updateScheduleById(
          widget.scheduleId!,
          ScheduleCompanion(
            date: Value(widget.selectedDate),
            startTime: Value(startTime!),
            endTime: Value(endTime!),
            content: Value(content!),
            colorId: Value(selectedColorId!),
          ),
        );
      }
    }

    Navigator.of(context).pop();
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;
  final String startInitialValue;
  final String endInitialValue;

  const _Time({
    required this.onStartSaved,
    required this.onEndSaved,
    required this.startInitialValue,
    required this.endInitialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            onSaved: onStartSaved,
            isTextField: false,
            initialValue: startInitialValue,
            label: '시작 시간',
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: CustomTextField(
            onSaved: onEndSaved,
            isTextField: false,
            initialValue: endInitialValue,
            label: '마감 시간',
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onContentSaved;
  final String initialValue;

  const _Content({
    required this.onContentSaved,
    required this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        onSaved: onContentSaved,
        isTextField: true,
        initialValue: initialValue,
        label: '내용',
      ),
    );
  }
}

typedef SetSelectedColorId = void Function(int selectedColorId);

class _ColorPicker extends StatelessWidget {
  final List<CategoryColorData> colors;
  final int? selectedColorId;
  final SetSelectedColorId setSelectedColorId;

  const _ColorPicker({
    required this.colors,
    required this.selectedColorId,
    required this.setSelectedColorId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 10.0,
      children: colors
          .map((color) => GestureDetector(
                onTap: () {
                  setSelectedColorId(color.id);
                },
                child: renderColor(color, color.id == selectedColorId),
              ))
          .toList(),
    );
  }

  Widget renderColor(CategoryColorData color, bool isSelected) {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: Colors.black, width: 3.0) : null,
        color: Color(
          int.parse(
            'FF${color.hexCode}',
            radix: 16,
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text('저장'),
            style: ElevatedButton.styleFrom(
              backgroundColor: PRIMARY_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
