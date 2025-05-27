import 'package:cubit_lesson/view_model/users_cubit/users_cubit.dart';
import 'package:cubit_lesson/view_model/users_cubit/users_state.dart';
import 'package:cubit_lesson/views/screens/home_screen.dart';
import 'package:cubit_lesson/views/widgets/my_button.dart';
import 'package:cubit_lesson/views/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    return Scaffold(
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(
                textAlign: TextAlign.center,
                state.errorMessege,
                style: TextStyle(
                    fontSize: 20, color: Colors.red),
              ),
            );
          } else if (state is SucseccState) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()),
              );
            });
            return Center(
                child:
                    Text("Redirecting...")); // yoki loading
          } else if (state is InitialState) {
            return SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login accaount",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please login your accaount",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextfield(
                      hintext:
                          "Enter your email or phone number",
                      icon: Icons.email,
                      title: "Email or Phone number",
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextfield(
                      hintext: "Please enter your password",
                      icon: Icons.lock,
                      title: "Password",
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot password",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    MyButton(
                      onTap: () async {
                        if (emailController.text.isEmpty ||
                            passwordController
                                .text.isEmpty) {
                          ScaffoldMessenger.of(context)
                            ..clearSnackBars()
                            ..showSnackBar(SnackBar(
                                content: Text(
                                    "Iltimos, ma'lumolarni kiriting")));
                        } else {
                          cubit.postUsers({
                            "id": DateTime.now()
                                .microsecond
                                .toInt(),
                            "username":
                                usernameController.text,
                            "email": emailController.text,
                            "password":
                                passwordController.text,
                          });
                        }
                      },
                      color:
                          Color.fromARGB(255, 17, 9, 165),
                      title: "Login accaount",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                                "Or using other method")),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      onTap: () {},
                      title: "Sign up with Google",
                      border: Border.all(
                        width: 0.7,
                        color: Colors.grey,
                      ),
                      textColol: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      onTap: () {},
                      title: "Sign up with Facebook",
                      border: Border.all(
                        width: 0.7,
                        color: Colors.grey,
                      ),
                      textColol: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
