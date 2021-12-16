import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/core/constants/colors.dart';
import 'package:shopping_provider/models/mock/product_mock.dart';
import 'package:shopping_provider/models/user_model.dart';
import 'package:shopping_provider/providers/cart_provider.dart';
import 'package:shopping_provider/service/get_data_service.dart';
import './my_home_page_view_model.dart';

class MyHomePageView extends MyHomePageViewModel {
  final List<ProductMock> _products = List.generate(
    10,
    (index) => ProductMock(
        name: 'Name: $index',
        imageUrl: 'https://source.unsplash.com/random/$index'),
  );
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Icon(Icons.menu),
                Spacer(),
                Text(
                  "Photos",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.arrow_back)
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (_, __) => Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              height: 190,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Padding(
                  padding: const EdgeInsets.only(left: 70, right: 15),
                  child: ListTile(
                    title: Text(
                      _products[__].name.toString(),
                      maxLines: 1,
                    ),
                    subtitle: SizedBox(
                      child: Image.network(
                        _products[__].imageUrl.toString(),
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              context
                                  .read<CartProvider>()
                                  .addProduct(_products[__]);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                padding: EdgeInsets.only(bottom: 60),
                                content: Text("Item is added!"),
                              ));
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

// class MyHomePageView extends MyHomePageViewModel {
//   List<int>? _products = [];
//   // final List<ProductMock> _products = List.generate(
//   //     10,
//   //     (index) => ProductMock(
//   //           name: 'Name: $index',
//   //           // imageUrl: 'https://source.unsplash.com/random/$index'),
//   //         ));
//   @override
//   Widget build(BuildContext context) {
//     // Replace this with your build function
//     return Scaffold(
//       backgroundColor: Colors.yellow,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20.0),
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               children: [
//                 Icon(Icons.menu),
//                 Spacer(),
//                 Text(
//                   "Photos",
//                   style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
//                 ),
//                 Spacer(),
//                 Icon(Icons.arrow_back)
//               ],
//             ),
//           )
//         ],
//       ),
//       body: FutureBuilder(
//         future: GetDataService().getData(),
//         builder: (context, AsyncSnapshot<List<Api>> snap) {
//           var data = snap.data;
//           if (snap.hasData) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: 10,
//                     itemBuilder: (_, __) => Container(
//                       padding: EdgeInsets.symmetric(vertical: 30),
//                       height: 190,
//                       width: MediaQuery.of(context).size.width,
//                       child: Card(
//                         elevation: 20,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         margin: EdgeInsets.symmetric(horizontal: 25),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 70, right: 15),
//                           child: ListTile(
//                             title: Text(
//                               "Author: ${data![__].author.toString()}",
//                               maxLines: 1,
//                             ),
//                             subtitle: Image.network(
//                               data[__].download_url.toString(),
//                               fit: BoxFit.cover,
//                               height: MediaQuery.of(context).size.height * 0.12,
//                               width: MediaQuery.of(context).size.width * 0.4,
//                             ),
//                             trailing: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 IconButton(
//                                   color: myPrimaryColor,
//                                   icon: const Icon(Icons.add),
//                                   onPressed: () {
//                                     context
//                                         .read<CartProvider>()
//                                         .addProduct(_products![__]);
//                                     Scaffold.of(context).showSnackBar(SnackBar(
//                                       padding: EdgeInsets.only(bottom: 60),
//                                       content: Text("Item is added!"),
//                                     ));
//                                   },
//                                 ),
//                                 // Expanded(
//                                 //   child: IconButton(
//                                 //     icon: const Icon(Icons.remove),
//                                 //     onPressed: () {},
//                                 //   ),
//                                 // ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
