import 'package:flutter/foundation.dart'; // Importing foundation for basic Flutter utilities.
import 'package:flutter/material.dart'; // Importing Material components for UI elements.
import 'package:get/get.dart'; // Importing GetX for state management.

// Create a controller class to manage the state of the colors
class ColorController extends GetxController {
  // Reactive variables that will update UI automatically when changed
  var colorBg = Colors.white.obs; // Background color
  var colorAppBar = Colors.white.obs; // App bar color
  var colorText = Colors.white.obs; // Text color

  // Method to change all colors to red
  void changeBgColor() {
    colorBg.value = Colors.red; // Set background color to red
    colorAppBar.value = Colors.red; // Set app bar color to red
    colorText.value = Colors.white; // Set text color to white
  }

  // Method to change all colors to blue
  void changeBgColor1() {
    colorBg.value = Colors.blue; // Set background color to blue
    colorAppBar.value = Colors.blue; // Set app bar color to blue
    colorText.value = Colors.white; // Set text color to white
  }

  // Method to reset all colors to default
  void reset() {
    colorBg.value = Colors.white; // Reset background to white
    colorAppBar.value = Colors.white; // Reset app bar to white
    colorText.value = Colors.black; // Reset text color to black
  }
}

// HomeView is the main screen of your app where you interact with the UI
class HomeView extends StatelessWidget {
  HomeView({super.key});
  final ColorController controller =
      Get.put(ColorController()); // Initialize the ColorController

  @override
  Widget build(BuildContext context) {
    // Building the UI structure
    return Scaffold(
      // Creating a custom app bar with a dynamic background and title
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56), // Define app bar height
        child: Obx(() => AppBar(
              // Obx makes the app bar reactive to changes
              backgroundColor: controller.colorAppBar
                  .value, // Set background color based on controller
              title: Text(
                "Change BG color",
                style: TextStyle(
                    color: controller.colorText
                        .value), // Set title text color based on controller
              ),
            )),
      ),
      body: Center(
        // The body of the app, where the content is displayed
        child: Obx(
          () => Container(
            color: controller.colorBg
                .value, // Set container background color based on controller
            height: double.infinity, // Fill the available space
            width: double.infinity, // Fill the available space
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center content horizontally
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
              children: [
                Column(
                  children: [
                    Text(
                      "Click to change color",
                      style: TextStyle(
                          fontSize: 20,
                          color: controller.colorText
                              .value), // Set text color based on controller
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row of buttons to change colors
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround, // Space buttons evenly
                      children: [
                        // Button to change background and app bar color to red
                        ElevatedButton(
                          onPressed: () {
                            controller.changeBgColor();
                          },
                          child: Text(
                            "Red",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        // Button to reset all colors
                        ElevatedButton(
                          onPressed: () {
                            controller.reset();
                          },
                          child: Text(
                            "Reset",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        // Button to change background and app bar color to blue
                        ElevatedButton(
                          onPressed: () {
                            controller.changeBgColor1();
                          },
                          child: Text(
                            "Blue",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          "Design UI by Makara",
                          style: TextStyle(
                            fontSize: 20,
                            color: controller.colorText.value,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
