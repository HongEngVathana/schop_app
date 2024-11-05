import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schop_app/constants/colors.dart';
import 'package:schop_app/screens/category/widgets/color_list.dart';
import 'package:schop_app/screens/category/widgets/filter_list.dart';

class FilterModalBottomSheet extends StatefulWidget {
  const FilterModalBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterModalBottomSheetState createState() => _FilterModalBottomSheetState();
}

class _FilterModalBottomSheetState extends State<FilterModalBottomSheet> {
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  void close(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  void resetFilters() {
    _minPriceController.clear();
    _maxPriceController.clear();
    // Reset other filters if necessary
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(28.0),
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => close(context),
                ),
                const Text(
                  'Filter',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    resetFilters();
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: primaryColor, fontSize: 16),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Price Range',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Container(
                    width: ((size.width / 2) - 55),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.black12,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _minPriceController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Minimum',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: 15,
                    height: 1,
                    color: Colors.black38,
                  ),
                  Container(
                    width: ((size.width / 2) - 55),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.black12,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _maxPriceController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Maximum',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Item Filter',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: FilterList(onSelect: (selected) => print(selected)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Item Color',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ColorList(
              // ignore: prefer_const_literals_to_create_immutables
              [
                Colors.white,
                Colors.black87,
                Colors.blue,
                Colors.cyan,
                Colors.red,
              ],
              onSelect: (color) => print(color),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: const EdgeInsets.all(20),
                  primary: primaryColor,
                ),
                child:
                    const Text('Apply Filter', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  close(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
