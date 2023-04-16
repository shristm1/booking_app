import 'package:booking_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/colors.dart';
import '../../widgets/date_selector/calendar_popup_view.dart';

class SearchAndFilter extends StatefulWidget {
  const SearchAndFilter({Key? key}) : super(key: key);

  @override
  State<SearchAndFilter> createState() => _SearchAndFilterState();
}

class _SearchAndFilterState extends State<SearchAndFilter> {

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 3));

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.primaryBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.iconColor.withOpacity(0.2),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: AppColors.secondaryBackgroundColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Search for city",
                  hintStyle: TextStyle(color:AppColors.iconColor.withOpacity(0.5)),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: AppColors.buttonColor,
                ),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            height: 54,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.iconColor.withOpacity(0.2),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: AppColors.secondaryBackgroundColor.withOpacity(0.23),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                // setState(() {
                //   isDatePopupOpen = true;
                // });
                showDemoDialog(context: context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                        color: AppColors.accentColor,
                      ),
                    ),
                    Icon(Icons.calendar_month_outlined, color: AppColors.primaryTextColor,),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.buttonColor),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                child: const SmallText(text: 'Search', color: AppColors.primaryBackgroundColor, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      // setState(() {
                      //   isDatePopupOpen = true;
                      // });
                      showDemoDialog(context: context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Choose date',
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Number of Rooms',
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            '1 Room - 2 Adults',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDemoDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }
}
