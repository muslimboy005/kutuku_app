import 'package:cubit_lesson/view_model/product_screen.dart/product_bloc.dart';
import 'package:cubit_lesson/view_model/product_screen.dart/product_event.dart';
import 'package:cubit_lesson/view_model/product_screen.dart/product_state.dart';
import 'package:cubit_lesson/views/screens/product_details_screen.dart';
import 'package:cubit_lesson/views/screens/search_screen.dart';
import 'package:cubit_lesson/views/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCategory = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductBloc>().add(LoadProducts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg')),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Jonathan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Let's go shopping",
                              style: TextStyle(
                                  color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SearchScreen(),
                              ));
                        },
                        child: Icon(
                          Icons.search,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.notifications_none),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      isCategory = false;
                      setState(() {});
                    },
                    child: Text(
                      'Home',
                      style: TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                      onTap: () {
                        isCategory = true;
                        setState(() {});
                      },
                      child: Text('Category',
                          style: TextStyle(
                              color: Colors.grey))),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFEFE9FE),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        '24% off shipping today on bag purchases\nBy Kutuku Store',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://www.althesys.com/wp-content/uploads/2024/06/fashion-clothing-hangers-show_1153-5492.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
              isCategory == true
                  ? ListView.separated(
                      physics:
                          NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 20),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) =>
                          Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(15),
                          color: const Color.fromARGB(
                              255, 91, 90, 89),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "New arrivals",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Image.network(
                                  "https://www.althesys.com/wp-content/uploads/2024/06/fashion-clothing-hangers-show_1153-5492.jpg")
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(
                        height: 15,
                      ),
                    )
                  : Column(children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'New Arrifals',
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                              Text(' 🔥'),
                            ],
                          ),
                          Text('See All',
                              style: TextStyle(
                                  color: Colors.deepPurple))
                        ],
                      ),
                      SizedBox(height: 10),
                      BlocBuilder<ProductBloc,
                          ProductState>(
                        builder: (context, state) {
                          return GridView.builder(
                            shrinkWrap: true,
                            itemCount:
                                state.products.length,
                            physics:
                                NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisExtent: 250,
                              crossAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index) {
                              final product =
                                  state.products[index];
                              return ProductCard(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailPage(
                                        product: product,
                                      ),
                                    ),
                                  );
                                },
                                name: product.title ?? '',
                                author:
                                    product.description ??
                                        '',
                                price: product.price
                                    .toString(),
                                imagePath:
                                    product.image ?? '',
                              );
                            },
                          );
                        },
                      ),
                    ])
            ],
          ),
        ),
      ),
    );
  }
}
