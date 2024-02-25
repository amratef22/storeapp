import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/services/get_all_products.dart';
import 'package:e_commerce/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id ='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:[
          IconButton(
            icon:const Icon(Icons.shopping_cart),
            onPressed: ()
            {},
          ),
        ],
        centerTitle: true,
        title: const Text('New Trend'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70,left: 12,right: 12,),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder:(context,snapshot)
          {
            if(snapshot.hasData)
            {
              List<ProductModel> products=snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing:100,
                ),
                itemBuilder: (context,index)
                {
                  return  CustomCard(product: products[index],);
                },
              );
            }else
            {
              return const Center(child: CircularProgressIndicator(color: Colors.red,));
            }

          },
        ),
      ),
    );
  }
}

