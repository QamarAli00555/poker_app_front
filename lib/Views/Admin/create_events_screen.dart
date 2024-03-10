import 'package:dotted_border/dotted_border.dart';

import '../../Customs/routes/imports.dart';

class CreateEvents extends StatefulWidget {
  const CreateEvents({super.key});

  @override
  _CreateEventsState createState() => _CreateEventsState();
}

class _CreateEventsState extends State<CreateEvents> {
  String? selectedEvent;
  String? newEventType;
  List<String> eventTypes = ['Type 1', 'Type 2', 'Type 3'];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime? selectedDateTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Alert.showConfirmationDialogue(context) ?? false;
      },
      child: renderBody(
        child: Scaffold(
          key: scaffoldKey,
          drawer: adminDrawer(context),
          appBar: renderAppbar(
            // revT: false,
            leading: () {
              scaffoldKey.currentState!.openDrawer();
            },
            trailing: () {
              AdminScreens.ADMINLOGOUT(context);
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: AppWidgetsSize.TEXTFIELD,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      goldDivider(),
                      customText('Create New Event', AppStyles.MEDIUM),
                      SizedBox(
                        height: 50.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: customText('Nightly', AppStyles.SMALL),
                                value: 'Nightly',
                                groupValue: selectedEvent,
                                activeColor: AppColors.PRIMARY_GOLD,
                                onChanged: (val) {
                                  setState(() {
                                    selectedEvent = val;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                title: customText('Featured', AppStyles.SMALL),
                                value: 'Featured',
                                groupValue: selectedEvent,
                                activeColor: AppColors.PRIMARY_GOLD,
                                onChanged: (val) {
                                  setState(() {
                                    selectedEvent = val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      heightSpacer(10.h),
                      SizedBox(
                        height: 50.h,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.PRIMARY_GOLD),
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: AppColors.FILL_COLOR,
                                ),
                                child: Center(
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor: AppColors.FILL_COLOR,
                                    style: null, // Remove default style
                                    value: selectedEvent,
                                    items: eventTypes
                                        .map((type) => DropdownMenuItem(
                                              value: type,
                                              child: customText(
                                                  type, AppStyles.SMALL),
                                            ))
                                        .toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        selectedEvent = val;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            widthSpacer(5),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          AppColors.PRIMARY_GOLD), // Red border
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Optional: Add border radius
                                  color:
                                      AppColors.FILL_COLOR, // Yellow fill color
                                ),
                                child: IconButton.filled(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) =>
                                                  AppColors.FILL_COLOR)),
                                  onPressed: () {
                                    setState(() {
                                      newEventType == null
                                          ? newEventType = ''
                                          : newEventType = null;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      heightSpacer(10.h),
                      if (newEventType != null) ...[
                        heightSpacer(5.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: customTextBox(
                                'Enter Type',
                                TextInputType.name,
                                TextEditingController(),
                                isProfile: true,
                                onChanged: (value) {
                                  newEventType = value;
                                },
                              ),
                            ),
                            widthSpacer(5.h),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          AppColors.PRIMARY_GOLD), // Red border
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Optional: Add border radius
                                  color:
                                      AppColors.FILL_COLOR, // Yellow fill color
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) =>
                                                  AppColors.FILL_COLOR)),
                                  onPressed: () {
                                    setState(() {
                                      eventTypes.add(newEventType!);
                                      newEventType = null;
                                    });
                                  },
                                  child: customText('SAVE', AppStyles.HEADING),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                      GestureDetector(
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1),
                          );
                          if (selectedDate != null) {
                            final selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (selectedTime != null) {
                              setState(() {
                                selectedDateTime = DateTime(
                                  selectedDate.year,
                                  selectedDate.month,
                                  selectedDate.day,
                                  selectedTime.hour,
                                  selectedTime.minute,
                                );
                              });
                            }
                          }
                        },
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.PRIMARY_GOLD),
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.FILL_COLOR,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_today,
                                  color: AppColors.PRIMARY_WHITE),
                              SizedBox(width: 10.w),
                              const Text(
                                'Select Date and Time',
                                style:
                                    TextStyle(color: AppColors.PRIMARY_WHITE),
                              ),
                            ],
                          ),
                        ),
                      ),
                      customTextBox('Enter Event Name', TextInputType.name,
                          TextEditingController()),
                      customTextBox('Enter Event Place', TextInputType.name,
                          TextEditingController()),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: customTextBox(
                              'Enter Amount',
                              TextInputType.name,
                              TextEditingController(),
                              // isProfile: true,
                            ),
                          ),
                          widthSpacer(5.h),
                          Expanded(
                            flex: 3,
                            child: customTextBox(
                              'Max Players?',
                              TextInputType.name,
                              TextEditingController(),
                              // isProfile: true,
                            ),
                          ),
                        ],
                      ),
                      customTextBox('Enter Brief Description',
                          TextInputType.text, TextEditingController(),
                          lines: 50, height: 200),
                      DottedBorder(
                        dashPattern: const [8, 4],
                        strokeWidth: 2,
                        color: AppColors.PRIMARY_GOLD,
                        child: Container(
                          height: 100.h,
                          width: AppWidgetsSize.TEXTFIELD,
                          color: AppColors.FILL_COLOR,
                          child: Image.asset(ImagePath.UPLOAD_IMG),
                        ),
                      ),
                      heightSpacer(10.h),
                      customButton('SAVE', () => null),
                      heightSpacer(10.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showNewTypeDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter New Event Type'),
          content: TextFormField(
            onChanged: (value) {
              newEventType = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  eventTypes.add(newEventType!);
                  newEventType = null;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
