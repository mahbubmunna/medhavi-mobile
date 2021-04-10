import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial1/helpers/style.dart';
import 'package:trial1/models/order.dart';
import 'package:trial1/provider/user.dart';
import 'package:trial1/widgets/custom_text.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: ListView.builder(
          itemCount: userProvider.orders.length,
          itemBuilder: (_, index) {
            OrderModel _order = userProvider.orders[index];
            return Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: red.withOpacity(0.2),
                          offset: Offset(3, 2),
                          blurRadius: 30)
                    ]),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      child: Image.network(
                        userProvider.userModel.favorite[index].image,
                        height: 100,
                        width: 140,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: userProvider
                                          .userModel.favorite[index].name +
                                      "\n",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "Npr. ${_order.total}" + "\n" + "\n",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: DateTime.fromMillisecondsSinceEpoch(
                                              _order.createdAt)
                                          .toString() +
                                      "\n",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ]),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.done,
                              color: green,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );

//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: black),
//         backgroundColor: white,
//         elevation: 0.0,
//         title: CustomText(text: "Orders"),
//         leading: IconButton(
//             icon: Icon(Icons.close),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//       ),
//       backgroundColor: white,
//       body: ListView.builder(
//           itemCount: userProvider.orders.length,
//           itemBuilder: (_, index) {
//             OrderModel _order = userProvider.orders[index];
//             return ListTile(
//               leading: CustomText(
//                 text: "Npr. ${_order.total}",
//                 weight: FontWeight.bold,
//               ),
//               title: Text(_order.description),
//               subtitle: Text(
//                   DateTime.fromMillisecondsSinceEpoch(_order.createdAt)
//                       .toString()),
//               trailing: CustomText(
//                 text: _order.status,
//                 color: green,
//               ),
//             );
//           }),
//     );
  }
}
