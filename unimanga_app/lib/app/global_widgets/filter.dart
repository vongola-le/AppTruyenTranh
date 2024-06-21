import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required void Function(List<int> selectedCategories) onCategorySelected});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> statusOptions = ['Tất cả', 'Đang ra', 'Hoàn thành'];
  List<String> sortOptions = ['Ngày cập nhật', 'Lượt xem', 'Truyện mới'];
  final List<String> categories = [
    'Action',
    'Comedy',
    'Drama',
    'Romance',
    'Sci-Fi',
    'Horror',
    'Documentary',
    'Animation',
    'Adventure',
    'Thriller',
    'Animation',
    'Adventure',
  ];
  String selectedStatus = 'Tất cả';
  List<String> selectedCategories = [];
  int _selectedIndex = -1;
  void _onCategorySelected(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = -1;
        selectedCategories.remove(categories[index]);
      } else {
        _selectedIndex = index;
        selectedCategories.add(categories[index]);
      }
    });

    // Notify list_manga.dart about the change in selectedCategories
    Navigator.of(context).pop(selectedCategories);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Trạng thái: '),
                  Row(
                    children: statusOptions.map((status) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedStatus == status
                                ? Colors.deepPurpleAccent
                                : Colors.deepPurple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Update the selected status
                            setState(() {
                              selectedStatus = status;
                            });

                            // Handle button press for the specific status
                            if (status == 'Tất cả') {
                              // All status button pressed
                            } else if (status == 'Đang ra') {
                              // In Progress status button pressed
                            } else if (status == 'Hoàn thành') {
                              // Completed status button pressed
                            }
                          },
                          child: Text(status),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Category section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Xếp theo: '),
                  Row(
                    children: sortOptions.map((status) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedStatus == status
                                ? Colors.deepPurpleAccent
                                : Colors.deepPurple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Update the selected status
                            setState(() {
                              selectedStatus = status;
                            });

                            if (status == 'Ngày cập nhật') {
                            } else if (status == 'Lượt xem') {
                            } else if (status == 'Truyện mới') {}
                          },
                          child: Text(status),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Thể loại: '),
                  for (int i = 0; i < categories.length; i += 2)
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(categories[i]),
                            value: _selectedIndex == i,
                            onChanged: (bool? value) {
                              _onCategorySelected(i);
                            },
                            activeColor: Colors.blueAccent,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        if (i + 1 < categories.length)
                          Expanded(
                            child: CheckboxListTile(
                              title: Text(categories[i]),
                              value: _selectedIndex == i,
                              onChanged: (bool? value) {
                                _onCategorySelected(i);
                              },
                              activeColor: Colors.blueAccent,
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                      ],
                    ),
                ],
              ),

              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
