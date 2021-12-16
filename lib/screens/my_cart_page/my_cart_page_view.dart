import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/core/constants/colors.dart';
import 'package:shopping_provider/models/user_model.dart';
import 'package:shopping_provider/providers/cart_provider.dart';
import 'package:shopping_provider/service/get_data_service.dart';
import './my_cart_page_view_model.dart';

class MyCartPageView extends MyCartPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Shopping Page",
          style: TextStyle(color: myPrimaryColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, __) => Dismissible(
                key: Key(context.watch<CartProvider>().listProduct.toString()),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    trailing: IconButton(
                      color: myPrimaryColor,
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                    title: Text(context
                        .watch<CartProvider>()
                        .listProduct[__]
                        .name
                        .toString()),
                    subtitle: SizedBox(
                      child: Image.network(
                        context
                            .watch<CartProvider>()
                            .listProduct[__]
                            .imageUrl
                            .toString(),
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  context.read<CartProvider>().dismissItem(__);
                },
              ),
              itemCount: context.watch<CartProvider>().listProduct.length,
            ),
          ),
        ],
      ),
    );
  }
}

// class MyCartPageView extends MyCartPageViewModel {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Shopping Page",
//           style: TextStyle(color: myPrimaryColor),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//               future: GetDataService().getData(),
//               builder: (context, AsyncSnapshot<List<Api>> snap) {
//                 var data = snap.data;
//                 if (snap.hasData) {
//                   return ListView.builder(
//                     itemBuilder: (_, __) {
//                       return Dismissible(
//                         key: Key(context.watch<CartProvider>().dismissItem(__)),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           child: ListTile(
//                             trailing: IconButton(
//                               color: myPrimaryColor,
//                               icon: Icon(Icons.delete),
//                               onPressed: () {},
//                             ),
//                             title: Text(data![context
//                                     .watch<CartProvider>()
//                                     .listProduct[__]]
//                                 .download_url
//                                 .toString()),
//                             subtitle: SizedBox(
//                               child: Image.network(
//                                 data[context
//                                         .watch<CartProvider>()
//                                         .listProduct[__]]
//                                     .download_url
//                                     .toString(),
//                                 fit: BoxFit.cover,
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.2,
//                                 width: MediaQuery.of(context).size.width * 0.4,
//                               ),
//                             ),
//                           ),
//                         ),
//                         onDismissed: (direction) {
//                           context.read<CartProvider>().dismissItem(__);
//                         },
//                       );
//                     },
//                     itemCount: context.watch<CartProvider>().listProduct.length,
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
