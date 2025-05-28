import 'package:cubit_lesson/view_model/splash_changed/splash_changed_bloc.dart';
import 'package:cubit_lesson/view_model/splash_changed/splash_changed_event.dart';
import 'package:cubit_lesson/view_model/splash_changed/splash_changed_state.dart';
import 'package:cubit_lesson/views/screens/signin_screen.dart';
import 'package:cubit_lesson/views/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List images = [
    "https://telegra.ph/file/9da1980e9af707c9404ad.jpg",
    "https://telegra.ph/file/ce810c0d1130304a564d2.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7F4s9dK8yHd-2p6ULT17rRkcZqwQfCHe7xumxXRWyWM5Dl6hruHEfac4SNIPVEPco6yA&usqp=CAU",
  ];
  void incrementCounter() {
    context
        .read<SplashChangedBloc>()
        .add(IncrementCounter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: BlocBuilder<SplashChangedBloc,
                SplashChangedState>(
              builder: (context, state) => Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(
                      images[state.counter],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Text(
              textAlign: TextAlign.center,
              "Varius collection of the latest product",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Text(
              textAlign: TextAlign.center,
              "Urnal amet, fashion design, vestibulitum, Varius collection of the latest product",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          BlocBuilder<SplashChangedBloc,
              SplashChangedState>(
            builder: (context, state) => Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: state.counter == 0
                        ? Color.fromARGB(255, 17, 9, 165)
                        : Colors.grey,
                  ),
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: state.counter == 1
                        ? Color.fromARGB(255, 17, 9, 165)
                        : Colors.grey,
                  ),
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: state.counter == 2
                        ? Color.fromARGB(255, 17, 9, 165)
                        : Colors.grey,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30),
            child: MyButton(
              onTap: () {
                incrementCounter();
                if (context
                        .read<SplashChangedBloc>()
                        .state
                        .counter ==
                    3) {
                  context
                      .read<SplashChangedBloc>()
                      .add(EndOnBoarding());
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SigninScreen(),
                    ),
                  );
                }
              },
              color: Color.fromARGB(255, 17, 9, 165),
              title: "Creat accaount",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {},
              child: Text("Are you have an accaount ?"))
        ],
      ),
    );
  }
}
