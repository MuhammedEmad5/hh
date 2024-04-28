import 'package:flutter/material.dart';

import 'form_navigation.dart';

class PagesFormView extends StatefulWidget {
  final List<Widget> data;
  final int itemsPerPage;
  const PagesFormView({super.key, required this.data, this.itemsPerPage = 4});

  @override
  State<PagesFormView> createState() => _PagesFormViewState();
}

class _PagesFormViewState extends State<PagesFormView> {
  int currentPage = 1;

  int getPagesCount() {
    return (widget.data.length / widget.itemsPerPage).ceil();
  }

  List<Widget> getPageData(int currentPage) {
    final startIndex = widget.itemsPerPage * (currentPage - 1);
    final endIndex = startIndex + widget.itemsPerPage;
    return widget.data
        .sublist(startIndex, endIndex.clamp(0, widget.data.length));
  }

  @override
  Widget build(BuildContext context) {
    final pagesCount = getPagesCount();
    final pageData = getPageData(currentPage);
    return Column(
      children: [
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: pageData.length,
          itemBuilder: (context, index) => pageData[index],
        ),
        FormNavigation(
          length: pagesCount,
          onChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
