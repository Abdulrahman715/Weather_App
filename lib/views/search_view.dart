import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4EABF4),
        foregroundColor: Colors.white,
        title: Text(
          'Search for a country',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:
                  controller, //! ربطنا اللى هيكتبه اليوزر بالمتغير اللى عملناه فوق

              decoration: InputDecoration(
                labelText: 'Enter city name',
                hintText: 'eg. Cairo',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.location_city),
                suffixIconColor: Color(0xff4EABF4),
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white70,
                errorText: controller.text.isEmpty
                    ? 'City name cannot be empty'
                    : null,
              ),

              style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.yellow[900],
              ),

              keyboardType: TextInputType.text,
              inputFormatters: [
                // ده الفلتر اللي بيسمح بالحروف العربية والإنجليزية والمسافات فقط
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z\s\u0600-\u06FF]'),
                ),
              ],

              textInputAction: TextInputAction.search,

              cursorColor: Color(0xff4EABF4), // لون المؤشر
              cursorWidth: 3.0, // يمكنك أيضاً التحكم في سمك المؤشر
              cursorRadius: Radius.circular(5,), // جعل حواف المؤشر دائرية بدلاً من حادة
            
              maxLength: 10, // الحد الأقصى لعدد الأحرف 
              // maxLengthEnforcement: MaxLengthEnforcement.enforced, // فرض الحد الأقصى لعدد الأحرف default behavior
              // buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null, // لإخفاء عداد الأحرف,
            ),

            

            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4EABF4),
                padding: EdgeInsets.all(25),
              ),
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: Text(
                "Search",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
