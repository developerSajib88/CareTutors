
import 'package:caretutors/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/font_styles.dart';

class TaskItemView extends StatefulWidget {
  Color statusColor;
  String statusName;
  String title;
  String description;
  String publishDate;
  String getId;
  TaskItemView({
    Key? key,
    required this.statusColor,
    required this.statusName,
    required this.title,
    required this.description,
    required this.publishDate,
    required this.getId,
  }) : super(key: key);

  @override
  State<TaskItemView> createState() => _TaskItemViewState();
}

class _TaskItemViewState extends State<TaskItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
      child: Container(width: double.infinity, height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: AppColors.defaultWhite,),
        child: Padding(padding: const EdgeInsets.all(10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: FontStyles.titleTextStyle),
              Text(widget.description, maxLines: 2, overflow: TextOverflow.ellipsis, style:FontStyles.descriptionTextStyle),

              Text(widget.publishDate, style: FontStyles.dateTextStyle),

              const SizedBox(height: 5.0,),

              Row(
                children: [

                  Container(height: 17, alignment: Alignment.center,
                    decoration: BoxDecoration(color: widget.statusColor, borderRadius: BorderRadius.circular(8),),
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(widget.statusName, style: FontStyles.statusTextStyle,),
                    ),
                  ),

                ],
              ),

              Row(
                children: [

                  const Spacer(),

                  SizedBox(width: 15, height: 15,
                    child: InkWell(
                        onTap: (){},
                        child: const Icon(Icons.text_snippet_outlined,color: AppColors.greenColor,size: 15,)
                    ),
                  ),

                  const SizedBox(width: 5,),


                  SizedBox(width: 15, height: 15,
                    child: InkWell(
                        onTap: (){
                        },
                        child: const Icon(Icons.delete_forever_outlined,color: AppColors.redColor,size: 15,)
                    ),
                  ),
                ],
              )

            ],
          ),
        ),

      ),
    );
  }
}
