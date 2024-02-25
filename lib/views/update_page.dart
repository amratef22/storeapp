
import 'package:e_commerce/componants/custom_botton.dart';
import 'package:e_commerce/componants/custom_text_field.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/services/update_product.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdatePage extends StatefulWidget {
   UpdatePage({super.key});


static String id = 'UpdatePage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productName,desc,image,price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =ModalRoute.of(context)!.settings.arguments as ProductModel ;
    return ModalProgressHUD(
      inAsyncCall:isLoading ,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Update Product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children:
              [
                const SizedBox(height: 85,),
                CustomTextFormField(
                  onChange: (data)
                  {
                    productName=data;
                  },
                  hint: 'Product Name',
                ),
                const SizedBox(height: 10,),
                CustomTextFormField(
                  onChange: (data)
                  {
                    desc=data;
                  },
                  hint: 'description',
                ),
                const SizedBox(height: 10,),
                CustomTextFormField(
                  onChange: (data)
                  {
                    price=data;
                  },
                  hint: 'price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 10,),
                CustomTextFormField(
                  onChange: (data)
                  {
                    image=data;
                  },
                  hint: 'image',
                ),
                const SizedBox(height: 40,),
                CustomButton(
                  text: 'Update',
                  onTab: ()
                  async {
                    isLoading = true;
                    setState(() {});
                    try {
                     await updateProduct(product);
                      print('Success');
                       const SnackBar(
                        content: Text('Success'),
                        backgroundColor: Colors.lightGreen,
                      );
                    } catch (e)
                    {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
   await UpdateProductService().updateProduct(
        title: productName==null ? product.title : productName!,
        price: price==null ? product.price.toString() : price!,
        desc: desc==null ? product.description : desc!,
        image: image==null ? product.image : image!,
        id: product.id,
        category: product.category,
    );
  }
}
