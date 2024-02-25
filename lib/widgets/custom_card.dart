import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/views/update_page.dart';
import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
   CustomCard({
    required this.product,
    super.key,
  });
ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, UpdatePage.id, arguments:  product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration:  BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    blurRadius: 50,
                    spreadRadius: 20,
                    offset: Offset(10, 10),
                  ),
                ]
            ),
            child:  Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text(
                      product.title.substring(0,12),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Text(
                          r'$ ''${product.price.toString()}',
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -60,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}