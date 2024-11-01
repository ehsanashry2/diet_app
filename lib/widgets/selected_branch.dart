import 'package:flutter/material.dart';
import 'package:untitled1/configuration/theme.dart';
import '../models/selectobject_model.dart';
class SelectedBranch extends StatefulWidget {
  const SelectedBranch({super.key});

  @override
  State<SelectedBranch> createState() => _SelectedBranchState();
}
class _SelectedBranchState extends State<SelectedBranch> {
  SelectObject value = SelectObject(value: -1, title: '', subtitle: '');
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        SelectObject? result = await displayBottomSheet(context, value, [
          SelectObject(title: "Richdiets Branch one", subtitle: "Dubai, Street 55 Dub Tower", value: 1),
          SelectObject(title: "Richdiets Branch Two", subtitle: "Dubai, Street 55 Dub Tower", value: 2),
        ]);
        value = result ?? SelectObject(value: -1, title: '', subtitle: '');
        setState(() {});
      },
      child: Container(
        height: 52,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:App_theme.borderGray, width: 1),
          color: App_theme.backgroundwhite,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(value.value == -1 ? "Select..." : value.title, overflow: TextOverflow.ellipsis,
              ),),
            const SizedBox(width: 8),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
displayBottomSheet(BuildContext context, SelectObject value, List<SelectObject> options) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: App_theme.backgroundwhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),),
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Select Branch", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: App_theme.borderGray, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: App_theme.black),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              color: App_theme.black,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context, options[index]);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: App_theme.primary, width: 1,
                                  ),),
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: value.value == options[index].value ? App_theme.primary : Colors.transparent,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(options[index].title),
                                    const SizedBox(height: 4),
                                    Text(
                                      options[index].subtitle,
                                      style: const TextStyle(
                                        color: App_theme.hinttextcolor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (index < options.length - 1)
                          const SizedBox(height: 16),
                        if (index < options.length - 1)
                          const Divider(height: 0, thickness: 1),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemCount: options.length,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
