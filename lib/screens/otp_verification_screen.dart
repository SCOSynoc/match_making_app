import 'package:flutter/material.dart';
import 'package:match_making/screens/profile_detail_screen2.dart';
import 'package:match_making/utils/navigation.dart';
import 'package:match_making/widgets/common_button.dart';



class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  VerificationScreenState createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  final List<String> _code = ["", "", "", ""];
  int _currentIndex = 0;

  void _onKeyPress(String key) {
    setState(() {
      if (_currentIndex < 4) {
        _code[_currentIndex] = key;
        _currentIndex++;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
        _code[_currentIndex] = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "00:42",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Text(
                "Type the verification code we've sent you",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _code.map((digit) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      digit,
                      style: TextStyle(fontSize: 24, color: Colors.red),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 12,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 40
                    ),
                    itemBuilder: (context, index) {
                      if (index == 9) {
                        return const SizedBox.shrink();
                      } else if (index == 11) {
                        return IconButton(
                          icon: const Icon(Icons.backspace),
                          onPressed: _onBackspace,
                        );
                      } else {
                        String digit = index == 10 ? "0" : (index + 1).toString();
                        return ElevatedButton(
                          onPressed: () => _onKeyPress(digit),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10), backgroundColor: Theme.of(context).primaryColorDark,
                          ),
                          child: Text(
                            digit,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Handle resend code
                },
                child: Text(
                  "Send again",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const SizedBox(height: 20,),
              CommonButton(onPressed: (){
                 navigateAndRemovePush(context, const ProfileDetailsScreens());
              }, text: "Verify", backgroundColor: Theme.of(context).primaryColorDark,)
            ],
          ),
        ),
      ),
    );
  }
}
